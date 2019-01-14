RspecApiDocumentation.configure do |config|
  config.docs_dir = Rails.root.join("public", "api")
  config.format = :open_api
  config.request_body_formatter = Proc.new do |params|
    # FIXME!
    # We define "client" parameter for devise token auth. And also there's a method called #client.
    # The returned value of that method gets set for the "client" parameter in a request.
    # We don't need this, that's why we have this little filter here. It's not the best solution.
    # It would be reasonable to use "config.client_method" configuration.
    # But that configuration breaks our custom RSpec helpers. They don't get included.
    # We need to report that issue, or find out how to fix it.
    params.delete('client') if params['client'].class == RspecApiDocumentation::RackTestClient
    params.to_json
  end
end
