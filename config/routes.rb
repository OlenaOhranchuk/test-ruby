Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount_devise_token_auth_for 'User', at: '/api/v1/users', controllers: {
    confirmations: 'api/v1/confirmations',
    omniauth_callbacks: 'api/v1/omniauth_callbacks',
    passwords:  'api/v1/passwords',
    registrations:  'api/v1/registrations',
    sessions:  'api/v1/sessions',
    token_validations:  'api/v1/token_validations'
  }

  get 'api' => redirect('/swagger/dist/index.html?url=/api/v1/open_api')

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get :open_api, to: 'api#open_api'

      devise_scope :user do
        resource :user, only: %i[show update]
      end
    end
  end
end
