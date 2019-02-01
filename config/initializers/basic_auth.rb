if ENV['BASIC_AUTH_NAME'].present? && ENV['BASIC_AUTH_PASSWORD'].present?
  Rails.application.config.basic_auth_creds = {
    name: ENV['BASIC_AUTH_NAME'],
    password: ENV['BASIC_AUTH_PASSWORD']
  }
end
