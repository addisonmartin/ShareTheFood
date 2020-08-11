class ApplicationController < ActionController::Base
  # Enables protection from cross-site request forgery (CSRF) attacks.
  protect_from_forgery with: :exception

  # Enables pagination on the backend.
  include Pagy::Backend

  # Tracks which user made a change to a model.
  before_action :set_paper_trail_whodunnit
end
