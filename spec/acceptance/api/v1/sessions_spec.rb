require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Sessions', type: :acceptance do
  let(:user) { create(:user) }

  post '/api/v1/users/sign_in' do
    with_options scope: :user, in: :body do
      parameter :email
      parameter :password
    end

    example 'Singing in a user' do
      do_request(user: { email: user.email, password: '12345678' })

      expect(status).to eq(200)
    end
  end

  delete '/api/v1/users/sign_out' do
    add_auth_parameters(optional: false)
    before { authenticate(user) }

    example 'Singing out the current user' do
      do_request

      expect(status).to eq(200)
    end
  end
end
