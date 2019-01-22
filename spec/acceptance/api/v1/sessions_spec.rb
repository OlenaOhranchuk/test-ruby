require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Sessions', type: :acceptance do
  let(:user) { create(:user) }

  post '/api/v1/users/sign_in' do
    with_options in: :body do
      parameter :email
      parameter :password
    end

    example 'Signing in a user' do
      do_request(email: user.email, password: '12345678')

      expect(status).to eq(200)
    end

    example 'Invalid password or email' do
      do_request(email: 'test@test.com', password: '12345678')

      expect(status).to eq(401)
    end
  end

  delete '/api/v1/users/sign_out' do
    add_auth_parameters(optional: false)
    before { authenticate(user) }

    example 'Signing out the current user' do
      do_request

      expect(status).to eq(200)
    end
  end
end
