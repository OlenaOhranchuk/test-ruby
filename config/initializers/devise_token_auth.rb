DeviseTokenAuth.setup do |config|
  # TODO: I think we should add some env variable here,
  # something like this: ENV['CONFIRM_SUCCESS_URL'].
  config.default_confirm_success_url = '/'
  config.default_password_reset_url = ENV['PASSWORD_RESET_URL']
  config.enable_standard_devise_support = true
  config.token_lifespan = 2.years
  config.batch_request_buffer_throttle = 10.seconds
  config.change_headers_on_each_request = false
  config.check_current_password_before_update = :password
end
