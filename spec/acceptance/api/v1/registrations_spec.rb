require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Registrations', type: :acceptance do
  let(:user) { create(:user) }

  post '/api/v1/users' do
    let(:singup_attributes) do
      attrs = attributes_for(:user).slice(:email, :password, :username, :first_name, :last_name)
      attrs.merge(password_confirmation: attrs[:password])
    end

    with_options in: :body do
      parameter :email
      parameter :password
      parameter :password_confirmation
      parameter :username
      parameter :first_name
      parameter :last_name
      parameter :confirm_success_url
    end

    example 'Signing up a user' do
      do_request(singup_attributes)

      expect(status).to eq(200)
    end

    example 'Invalid attributes' do
      do_request(singup_attributes.merge(email: 'test.com'))

      expect(status).to eq(422)
    end
  end

  put '/api/v1/users' do
    add_auth_parameters
    before { authenticate(user) }
    let(:update_attributes) do
      attrs = attributes_for(:user).slice(:email, :username, :first_name, :last_name)
      attrs.merge(
        password: 'qwerty12',
        password_confirmation: 'qwerty12',
        current_password: '12345678'
      )
    end

    with_options in: :body do
      parameter :email
      parameter :password
      parameter :password_confirmation
      parameter :username
      parameter :first_name
      parameter :last_name
      parameter :current_password
    end

    example 'Updating attributes of the current user' do
      do_request(update_attributes)

      expect(status).to eq(200)
    end

    example 'Invalid attributes' do
      do_request(update_attributes.merge(email: 'test.com'))

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
