class DeviceCodeController < ApplicationController
  def show
    device_category_id = params[:device_category_id]
    template_code = ""
    max_code = 0
    if device_category_id.present?
      devices = Device.of_category device_category_id
      device_category = DeviceCategory.find_by id: device_category_id
      if device_category
        template_code = device_category.template_code
        get_new_device devices, template_code
      end
    end
    max_code = max_code + 1
    new_code = render_new_device_code max_code

    respond_to do |format|
      format.js{render json: {device_code: template_code + new_code + max_code.to_s}}
    end
  end

  private

  def get_new_device devices, template_code
    if devices.present?
      devices.each do |device|
        device_code = device.device_code
        current_code = device_code.gsub(template_code, "") if device_code.include? template_code
        if is_number? current_code
          unless max_code > current_code.to_i
            max_code = current_code.to_i
          end
        end
      end
    end
  end

  def render_new_device_code max_code
    new_code = ""
    total_char_append = Settings.device_code.max_length - max_code.to_s.mb_chars.length
    if total_char_append > 0
      for i in 1..total_char_append
        new_code = new_code + "0"
      end
    end
    new_code
  end
end
