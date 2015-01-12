class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource_or_scope)
  	start_page_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def require_authentication
		unless user_signed_in?
			redirect_to sign_in_path,
			alert: 'You must be logged in'
		end
	end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name      
  end

end
