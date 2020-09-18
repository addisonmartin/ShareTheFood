# frozen_string_literal: true

# rubocop:disable Lint/UselessMethodDefinition

# The controller for user unlocking locked accounts. Inherits from Devise's unlocks controller.
# Application specific overriding of devise's defaults happens here.
class Users::UnlocksController < Devise::UnlocksController
  # Don't ensure user authorization was performed.
  skip_after_action :verify_authorized

  # GET /resource/unlock/new
  def new
    super
  end

  # POST /resource/unlock
  def create
    super
  end

  # GET /resource/unlock?unlock_token=abcdef
  def show
    super
  end

  protected

  # The path used after sending unlock password instructions
  def after_sending_unlock_instructions_path_for(resource)
    super(resource)
  end

  # The path used after unlocking the resource
  def after_unlock_path_for(resource)
    super(resource)
  end
end

# rubocop:enable Lint/UselessMethodDefinition
