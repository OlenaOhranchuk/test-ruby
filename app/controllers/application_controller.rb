class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  if Rails.application.config.try(:basic_auth_creds).present?
    http_basic_authenticate_with(Rails.application.config.basic_auth_creds)
  end
end
