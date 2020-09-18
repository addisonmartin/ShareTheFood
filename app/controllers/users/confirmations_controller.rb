# frozen_string_literal: true

# rubocop:disable Lint/UselessMethodDefinition

# The controller for user email confirmations. Inherits from Devise's confirmations controller.
# Application specific overriding of devise's defaults happens here.
class Users::ConfirmationsController < Devise::ConfirmationsController
  # Don't ensure user authorization was performed.
  skip_after_action :verify_authorized

  # GET /resource/confirmation/new
  def new
    super
  end

  # POST /resource/confirmation
  def create
    super
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    super
  end

  protected

  # The path used after resending confirmation instructions.
  def after_resending_confirmation_instructions_path_for(resource_name)
    super(resource_name)
  end

  # The path used after confirmation.
  def after_confirmation_path_for(resource_name, resource)
    super(resource_name, resource)
  end
end

# rubocop:enable Lint/UselessMethodDefinition
