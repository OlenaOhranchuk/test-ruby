require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Passwords', type: :acceptance do
  let(:user) { create(:user) }

  post '/api/v1/users/password' do
    with_options in: :body do
      parameter :email
      parameter :redirect_url
    end

    example 'Requesting a password change' do
      do_request(email: user.email, redirect_url: 'example.com')

      expect(status).to eq(200)
    end

    example "User's email is not found" do
      do_request(email: 'not@found.com', redirect_url: 'example.com')

      expect(status).to eq(404)
    end
  end

  put '/api/v1/users/password' do
    add_auth_parameters
    parameter 'token', '', type: :string, in: :header, required: true

    with_options in: :body do
      parameter :password
      parameter :password_confirmation
    end

    example 'Updating the password' do
      no_doc { @password_reset_headers = get_password_reset_headers }
      @password_reset_headers.each { |name, value| header name, value.first }
      do_request(password: '12345678', password_confirmation: '12345678')

      expect(status).to eq(200)
    end

    example 'New password is invalid' do
      no_doc { @password_reset_headers = get_password_reset_headers }
      @password_reset_headers.each { |name, value| header name, value.first }
      do_request(password: '12345', password_confirmation: '12345')

      expect(status).to eq(422)
    end
  end
end

def get_password_reset_headers
  # Request a password change.
  attrs = { email: user.email, redirect_url: 'http://localhost:3000' }
  api_client.post '/api/v1/users/password', attrs

  # Clink at the link in the password reset email.
  reset_mail = ActionMailer::Base.deliveries.last.body.raw_source
  reset_link = Nokogiri::HTML(reset_mail).at_css('a').values.first
  api_client.get reset_link

  # Parse parametes from the query string for the password update request.
  uri = URI.parse(response_headers['Location'])
  CGI.parse(uri.query)
end
