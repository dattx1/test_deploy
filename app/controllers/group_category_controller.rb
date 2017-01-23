class GroupCategoryController < ApplicationController
  def show
    @device_categories = DeviceCategory.find_by_group params[:id]
    respond_to do |format|
      format.js {render json: @device_categories}
    end
  end
end
