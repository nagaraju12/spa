class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) {|u| u.permit!}
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      if current_user.role_name == "Admin" && current_user.role_id == 1
        admin_dashboards_path
      else
        homes_path
      end
    end
  end

  def is_admin?
    unless current_user.role_name == 'Admin' && current_user.role_id == 1
      flash[:error] = "Please Login"
      redirect_to '/'
    end
  end
end
