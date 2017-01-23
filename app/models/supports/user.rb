class Supports::User

  def initialize user
    @user = user
  end

  def created_by user_id
    all_users
    created = @all_users.find_by id: user_id
    @created_by = created.name if created.present?
  end

  def device_categories
    @device_categories ||= DeviceCategory.all
  end

  def device_status_not_include_using
    @device_status ||= DeviceStatus.not_in_ids Settings.device_status.using
  end

  def device_status_all
    @device_status ||= DeviceStatus.all
  end

  def device_group_categories
    @device_group_categories ||= DeviceGroup.all
  end

  def device_can_assign
    @device_can_assign ||= Device.device_can_assign
  end

  def invoices
    @device_invoices ||= Invoice.all
  end

  def requests
    @requests ||= Request.all
  end

  def all_users
    @all_users ||= User.all
  end

  def derpartment_user department_id
    @derpartment_user ||= User.of_department department_id
  end
end
