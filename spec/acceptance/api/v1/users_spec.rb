require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Users" do
  add_content_type_parameter
  add_auth_parameters

  let(:user) { create(:user) }
  before { authenticate!(user) }

  get '/api/v1/users/:id' do
    let(:id) { user.id }

    example "Getting user's data" do
      do_request

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
