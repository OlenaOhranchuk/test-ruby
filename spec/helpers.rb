module Helpers
  # Helper method to parse a response
  #
  # @return [Hash]
  def json
    JSON.parse(response.body).with_indifferent_access
  end

  # TODO: Remove this. Use #create_new_auth_token directly.
  def auth_headers
    user.create_new_auth_token
  end
end
