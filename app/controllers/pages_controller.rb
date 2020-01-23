# frozen_string_literal: true

# Renders views that are not backed by database models.
class PagesController < ApplicationController
  # Skip authorization.
  skip_after_action :verify_authorized

  # Renders the page based based on the given page parameter,
  # or renders the 404 error page if the page parameter is invalid.
  def show
    # Only render pages that are explicitly whitelisted.
    if ['home'].include? params[:page]
      render template: "pages/#{params[:page]}"
    else
      render file: 'public/404.html', status: :not_found
    end
  end
end
