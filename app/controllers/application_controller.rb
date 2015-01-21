class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

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

  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name      
  end

end
