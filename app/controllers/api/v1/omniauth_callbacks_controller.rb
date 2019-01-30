module Api
  module V1
    class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
      include Api::Concerns::ActAsApiRequest
      skip_before_action :skip_session_storage

      # NOTE: Investigate #get_resource_from_auth_hash method in order
      # to understand how a user gets created from provider params.
    end
  end
end
