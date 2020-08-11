class ApplicationController < ActionController::Base
  # Enables protection from cross-site request forgery (CSRF) attacks.
  protect_from_forgery with: :exception

  # Enables user authorization.
  include Pundit
  # Ensures user authorization was performed.
  after_action :verify_authorized

  # Tracks which user made a change to a model.
  before_action :set_paper_trail_whodunnit

  # Enables pagination on the backend.
  include Pagy::Backend
end
