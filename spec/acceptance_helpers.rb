module AcceptanceHelpers
  def authenticate!(resource)
    resource.create_new_auth_token.each do |name, value|
      header name, value
    end
  end
end
