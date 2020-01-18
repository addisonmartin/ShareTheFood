# frozen_string_literal: true

# All other controllers inherit from this controller.
class ApplicationController < ActionController::Base
  # Enables user authorization.
  include Pundit

  # Enables protection against cross-site request forgery (CSRF) attacks.
  protect_from_forgery with: :exception

  # Tracks which user made each change to models.
  before_action :set_paper_trail_whodunnit

  # Enables paginating models.
  include Pagy::Backend
end
