require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Registrations', type: :acceptance do
  let(:user) { create(:user) }

  post '/api/v1/users' do
    with_options scope: :user, in: :body do
      parameter :email
      parameter :password
      parameter :password_confirmation
      parameter :username
      parameter :first_name
      parameter :last_name
    end

    example 'Signing up a user' do
      attrs = attributes_for(:user).slice(:email, :password, :username, :first_name, :last_name)
      do_request(user: attrs.merge(password_confirmation: attrs[:password]))

      expect(status).to eq(200)
    end

    example 'Invalid attributes' do
      attrs = attributes_for(:user).slice(:email, :password, :username, :first_name, :last_name)
      do_request(user: attrs.merge(password_confirmation: '12345'))

      expect(status).to eq(422)
    end
  end

  put '/api/v1/users' do
    add_auth_parameters
    before { authenticate(user) }

    with_options in: :body do
      parameter :current_password
      parameter :password
      parameter :password_confirmation
    end

    example 'Updating password of the current user' do
      do_request(
        current_password: '12345678',
        password: 'qwerty12',
        password_confirmation: 'qwerty12'
      )

      expect(status).to eq(200)
    end

    example 'Invalid attributes' do
      do_request(
        current_password: '12345',
        password: 'qwerty12',
        password_confirmation: 'qwerty12'
      )

      expect(status).to eq(422)
    end
  end

  delete '/api/v1/users' do
    add_auth_parameters(optional: false)
    before { authenticate(user) }

    example 'Deleting the current user' do
      do_request

      expect(status).to eq(200)
    end
  end
end
