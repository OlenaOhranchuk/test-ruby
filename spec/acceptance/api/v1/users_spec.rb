require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Users', type: :acceptance do
  add_auth_parameters

  let(:user) { create(:user) }
  before { authenticate!(user) }

  get '/api/v1/user/profile' do
    example 'Getting data of the current user' do
      do_request

      expect(status).to eq(200)
    end
  end

  get '/api/v1/users/:id' do
    example "Getting user's data" do
      do_request(id: user.id)

      expect(status).to eq(200)
    end
  end

  patch '/api/v1/user' do
    with_options scope: :user, in: :body do
      parameter :username
      parameter :first_name
      parameter :last_name
      parameter :email
    end

    example 'Updating data of the current user' do
      attrs = attributes_for(:user).slice(:email, :username, :first_name, :last_name)
      do_request(user: attrs)

      expect(status).to eq(200)
    end
  end
end
