# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Enables protection against cross-site request forgery (CSRF) attacks.
  protect_from_forgery with: :exception

  # Enables user authorization.
  include Pundit

  # Tracks which user, if any, made changes to the models being tracked by Paper Trail.
  before_action :set_paper_trail_whodunnit
end
