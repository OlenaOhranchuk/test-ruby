module AcceptanceHelpers
  def json
    JSON.parse(response_body).with_indifferent_access
  end

  def authenticate!(resource)
    resource.create_new_auth_token.each do |name, value|
      header name, value
    end
  end
end
