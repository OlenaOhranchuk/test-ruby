require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Users', type: :acceptance do
  add_auth_parameters

  let(:user) { create(:user) }
  before { authenticate(user) }

  get '/api/v1/user' do
    example 'Getting data of the current user' do
      do_request

      expect(status).to eq(200)
    end
  end

  put '/api/v1/user' do
    with_options scope: :user, in: :body do
      parameter :email
      parameter :username
      parameter :first_name
      parameter :last_name
    end

    example 'Updating data of the current user' do
      attrs = attributes_for(:user).slice(:email, :username, :first_name, :last_name)
      do_request(user: attrs)

      expect(status).to eq(200)
    end

    example 'Invalid attributes' do
      do_request(user: { email: 'test.com' })

      expect(status).to eq(400)
    end
  end
end
