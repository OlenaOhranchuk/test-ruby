module AcceptanceGroupHelpers
  def add_content_type_parameter
    parameter 'Content-Type', '', type: :string, in: :header, default: 'application/json', required: true
  end

  def add_auth_parameters
    parameter 'access-token', '', type: :string, in: :header, required: true
    parameter 'client', '', type: :string, in: :header, required: true
    parameter 'uid', '', type: :string, in: :header, required: true
    parameter 'token-type', '', type: :string, in: :header
    parameter 'expiry', '', type: :integer, in: :header
  end
end
