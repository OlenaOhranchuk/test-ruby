require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Users', type: :acceptance do
  add_auth_parameters

  let(:current_user) { create(:user) }
  before { authenticate!(current_user) }

  get '/api/v1/users/:id' do
    example "Getting user's data" do
      do_request(id: current_user.id)

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

    example 'Updating data of current user' do
      data = attributes_for(:user).slice(:username, :first_name, :last_name, :email)
      do_request(user: data)

      expect(status).to eq(200)
    end
  end

  get '/api/v1/user/profile' do
    example 'Getting data of current user' do
      do_request

      expect(status).to eq(200)
    end
  end
end
