if Rails.env.qa? || Rails.env.staging? || Rails.env.production?
  Rails.application.config.basic_auth_creds = {
    name: 'rails_api_base',
    password: 'password'
  }
end
