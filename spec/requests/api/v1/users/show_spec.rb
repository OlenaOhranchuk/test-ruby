require 'rails_helper'

describe 'GET api/v1/user', type: :request do
  let(:user) { create(:user) }
  let(:auth_headers) { user.create_new_auth_token }

  it 'returns success' do
    get api_v1_user_path, headers: auth_headers, as: :json
    expect(response).to have_http_status(:success)
  end

  it 'returns user\'s data' do
    get api_v1_user_path, headers: auth_headers, as: :json

    expect(json[:user][:id]).to eq user.id
    expect(json[:user][:first_name]).to eq user.first_name
  end
end
