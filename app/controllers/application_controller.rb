class ApplicationController < ActionController::Base
  # Enables protection from cross-site request forgery (CSRF) attacks.
  protect_from_forgery with: :exception

  # Enables user authorization.
  include Pundit
  # Ensures user authorization was performed.
  # after_action :verify_authorized

  # Tracks which user made a change to a model.
  before_action :set_paper_trail_whodunnit

  # Enables pagination on the backend.
  include Pagy::Backend

  # Sets the application locale if it is provided in the URL parameter 'locale', or uses the default locale if none is provided.
  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  # Sets the default URL option to include the locale parameter.
  # This prevents having to include the locale parameter in every url_for, root_path, donation_path, etc. call.
  def default_url_options
    { locale: I18n.locale }
  end
end
