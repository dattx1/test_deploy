class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "user.require_logged"
      redirect_to login_url
    end
  end

  def set_created_by object
    object.created_by = current_user.id
    object.updated_by = current_user.id
  end

  def set_updated_by object
    object.updated_by = current_user.id
  end

  def is_number? string
    true if Float(string) rescue false
  end
end
