module Api
  module V1
    class ConfirmationsController < DeviseTokenAuth::ConfirmationsController
      include Api::Concerns::ActAsApiRequest
    end
  end
end
