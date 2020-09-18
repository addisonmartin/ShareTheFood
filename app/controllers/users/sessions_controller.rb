# frozen_string_literal: true

# rubocop:disable Lint/UselessMethodDefinition

# The controller for user sign ins. Inherits from Devise's sessions controller.
# Application specific overriding of devise's defaults happens here.
class Users::SessionsController < Devise::SessionsController
  # Don't ensure user authorization was performed.
  skip_after_action :verify_authorized

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

# rubocop:enable Lint/UselessMethodDefinition
