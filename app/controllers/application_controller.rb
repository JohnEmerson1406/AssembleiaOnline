class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception
 
   before_action :configure_permitted_parameters, if: :devise_controller?
   protected
 
      def configure_permitted_parameters
         devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name, :pre_registration_id, :email,
          :password, :cpf, :ap, :bloc)}
         devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:user_name, :pre_registration_id, :email,
          :password, :current_password, :cpf, :ap, :bloc)}
      end
 
end
