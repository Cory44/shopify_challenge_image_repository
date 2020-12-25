class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password])

    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:username, :password, :password_confirmation)
    end
  end
end
