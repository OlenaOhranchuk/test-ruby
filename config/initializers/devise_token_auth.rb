DeviseTokenAuth.setup do |config|
  config.default_confirm_success_url = ENV['CONFIRM_SUCCESS_URL']
  config.default_password_reset_url = ENV['PASSWORD_RESET_URL']
  config.enable_standard_devise_support = true
  config.token_lifespan = 2.years
  config.batch_request_buffer_throttle = 10.seconds
  config.change_headers_on_each_request = false
  config.check_current_password_before_update = :password

  # WARNIGN: Devise-Token-Auth doesn't support email reconfirmation yet.
  # Devise has all necessary code for that in RegistrationsController#update action.
  # Devise-Token-Auth RegistrationsController#update action has nothing for reconfirmation.
end
