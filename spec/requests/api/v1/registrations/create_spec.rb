require 'rails_helper'

describe 'POST api/v1/users', type: :request do
  let(:user)                  { User.last }
  let(:failed_response)       { 422 }
  let(:username)              { 'test' }
  let(:email)                 { 'test@test.com' }
  let(:password)              { '12345678' }
  let(:password_confirmation) { '12345678' }
  let(:first_name)            { 'Johnny' }
  let(:last_name)             { 'Perez' }
  let(:params) do
    {
      username: username,
      email: email,
      password: password,
      password_confirmation: password_confirmation,
      first_name: first_name,
      last_name: last_name
    }
  end

  it 'returns a successful response' do
    post user_registration_path, params: params, as: :json

    expect(response).to have_http_status(:success)
  end

  it 'creates the user' do
    expect {
      post user_registration_path, params: params, as: :json
    }.to change(User, :count).by(1)
  end

  it 'returns the user' do
    post user_registration_path, params: params, as: :json

    expect(json[:data][:id]).to eq(user.id)
    expect(json[:data][:email]).to eq(user.email)
    expect(json[:data][:username]).to eq(user.username)
    expect(json[:data][:uid]).to eq(user.uid)
    expect(json[:data][:provider]).to eq('email')
    expect(json[:data][:first_name]).to eq(user.first_name)
    expect(json[:data][:last_name]).to eq(user.last_name)
  end

  context 'when the email is not correct' do
    let(:email) { 'invalid_email' }

    it 'does not create a user' do
      expect {
        post user_registration_path, params: params, as: :json
      }.not_to change { User.count }
    end

    it 'does not return a successful response' do
      post user_registration_path, params: params, as: :json

      expect(response.status).to eq(failed_response)
    end
  end

  context 'when the password is incorrect' do
    let(:password)              { 'short' }
    let(:password_confirmation) { 'short' }
    let(:new_user)              { User.find_by_email(email) }

    it 'does not create a user' do
      post user_registration_path, params: params, as: :json

      expect(new_user).to be_nil
    end

    it 'does not return a successful response' do
      post user_registration_path, params: params, as: :json

      expect(response.status).to eq(failed_response)
    end
  end

  context 'when passwords don\'t match' do
    let(:password)              { 'shouldmatch' }
    let(:password_confirmation) { 'dontmatch' }
    let(:new_user)              { User.find_by_email(email) }

    it 'does not create a user' do
      post user_registration_path, params: params, as: :json

      expect(new_user).to be_nil
    end

    it 'does not return a successful response' do
      post user_registration_path, params: params, as: :json

      expect(response.status).to eq(failed_response)
    end
  end
end
