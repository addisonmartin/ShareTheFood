# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Enables protection against cross-site request forgery (CSRF) attacks.
  protect_from_forgery with: :exception

  # Enables user authorization.
  include Pundit

  # Tracks which user, if any, made changes to the models being tracked by Paper Trail.
  before_action :set_paper_trail_whodunnit

  # Enables pagination of models in controllers.
  include Pagy::Backend

  # Configures Devise to also allow the name attribute for Users.
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
