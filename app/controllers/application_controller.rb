class ApplicationController < ActionController::Base
  before_action :configure_premitted_parameters, if: :devise_controller?
  before_action :basic_auth

  protected

  def configure_premitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :phone_num, :birthday])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end

