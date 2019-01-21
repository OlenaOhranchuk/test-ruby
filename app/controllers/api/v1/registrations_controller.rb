# encoding: utf-8

module Api
  module V1
    class RegistrationsController < DeviseTokenAuth::RegistrationsController
      protect_from_forgery with: :exception
      include Api::Concerns::ActAsApiRequest
      before_action :configure_permitted_parameters, if: :devise_controller?

      private

      def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation,
                                     :username, :first_name, :last_name)
      end

      def render_create_success
        render json: { user: resource_data }
      end

      # PUT api/v1/users allows updating only a password and it requires
      # a current password for that. It actually could update anything in
      # the current user, but we already have another route for that, which
      # is PUT api/v1/user. Using this new route we can update anything
      # expect password.
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(
          :account_update,
          keys: %i[password password_confirmation current_password]
        )
      end
    end
  end
end
