# frozen_string_literal: true

# This controller is application controller and will handle all other classes
class ApplicationController < ActionController::Base
  include Pundit
  include ApplicationHelper
  include Assignable
  before_action :authenticate_user!
  @have_header = true

  # After authentication send to specific layout page
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :role, :email, :password) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :password, :current_password) }
  end

  def layout_by_resource
    if devise_controller?
      false
    else
      'application'
    end
  end

  private

  def after_sign_in_path_for(resource)
    if resource.Moderator?
      '/blogs'
    elsif resource.User?
      '/dashboard'
    elsif resource.Admin?
      '/admin'
    end
  end
end
