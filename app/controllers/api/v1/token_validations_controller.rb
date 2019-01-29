module Api
  module V1
    class TokenValidationsController < DeviseTokenAuth::TokenValidationsController
      include Api::Concerns::ActAsApiRequest
    end
  end
end
