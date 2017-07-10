class ApplicationController < ActionController::Base

  def reject_user_not_belongs_to_group
    redirect_to :root unless current_user.join_group?(@group)
  end

  before_action :authenticate_user!
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    root_path
  end
end
