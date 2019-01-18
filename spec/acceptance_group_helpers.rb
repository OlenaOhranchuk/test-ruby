module AcceptanceGroupHelpers
  def add_auth_parameters(args = {})
    args.reverse_merge(optional: true)

    parameter 'access-token', '', type: :string, in: :header, required: true
    parameter 'client', '', type: :string, in: :header, required: true
    parameter 'uid', '', type: :string, in: :header, required: true

    return false unless args[:optional]

    parameter 'token-type', '', type: :string, in: :header
    parameter 'expiry', '', type: :integer, in: :header
  end
end
