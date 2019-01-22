# encoding: utf-8

module Api
  module V1
    class RegistrationsController < DeviseTokenAuth::RegistrationsController
      protect_from_forgery with: :exception
      include Api::Concerns::ActAsApiRequest
      before_action :configure_permitted_parameters, if: :devise_controller?

      private

      # Override #sign_up_params or #account_update_params methods
      # instead of adding this before action if you need to pass
      # more complicated params(embedded etc.).
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(
          :sign_up,
          keys: %i[
            email
            password
            password_confirmation
            username
            first_name
            last_name
            confirm_success_url
          ]
        )

        # Using PUT api/v1/users route (devise token auth), you're
        # able to update a password(providing current password) and other
        # user's attributes. But this route isn't very flexible.
        # There is another one, PUT api/v1/user. You can configure it however
        # you want, because it points to our custom controller.
        # Eventually, you can decide which one to use. But keep in mind
        # that the last route doesn't support a password update(you can implement it).
        devise_parameter_sanitizer.permit(
          :account_update,
          keys: %i[
            email
            password
            password_confirmation
            username
            first_name
            last_name
            current_password
          ]
        )
      end
    end
  end
end
