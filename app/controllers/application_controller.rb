class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email)
    end

    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ roles: [] }, :username, :email, :password, :password_confirmation)
    end
  end

  def force_profile
    if current_user.tenant.nil? && current_user.role.name == "tenant"
      flash[:notice] = "You must complete your profile"
      redirect_to new_tenant_url
    end
  end

  helper_method :resource, :resource_name, :devise_mapping

end
