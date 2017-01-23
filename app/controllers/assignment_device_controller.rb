class AssignmentDeviceController < ApplicationController
  before_action :init_data

  def show
     respond_to do |format|
      format.js
    end
  end

  private

  def init_data
    @support = Supports::User.new current_user
  end
end
