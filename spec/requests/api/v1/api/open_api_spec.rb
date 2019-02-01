require 'rails_helper'

describe 'GET api/v1/open_api', type: :request do
  it 'returns a successful response' do
    get api_v1_open_api_path, as: :json

    expect(response).to have_http_status(:success)
    expect(json[:swagger]).to eq '2.0'
  end
end
