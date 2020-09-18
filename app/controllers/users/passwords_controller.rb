# frozen_string_literal: true

# rubocop:disable Lint/UselessMethodDefinition

# The controller for user passwords. Inherits from Devise's passwords controller.
# Application specific overriding of devise's defaults happens here.
class Users::PasswordsController < Devise::PasswordsController
  # Don't ensure user authorization was performed.
  skip_after_action :verify_authorized

  # GET /resource/password/new
  def new
    super
  end

  # POST /resource/password
  def create
    super
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    super
  end

  # PUT /resource/password
  def update
    super
  end

  protected

  def after_resetting_password_path_for(resource)
    super(resource)
  end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(resource_name)
    super(resource_name)
  end
end

# rubocop:enable Lint/UselessMethodDefinition
