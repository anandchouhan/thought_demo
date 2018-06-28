class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user! 
  protect_from_forgery with: :exception
  before_action :set_locale
 
  

  def new_session_path(scope)
    new_user_session_path
  end


  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
  end 


  def after_sign_in_path_for(resource)
    homes_path
  end

end
