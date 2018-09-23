class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :store_location
  protect_from_forgery with: :exception

  private

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.env['HTTP_REFERER'] unless request.env['HTTP_REFERER'] =~ /(\/users\/sign)|(facebook)/
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || session[:previous_url] || root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:kid_birth])
    devise_parameter_sanitizer.permit(:account_update, keys: [:kid_birth])
  end
end
