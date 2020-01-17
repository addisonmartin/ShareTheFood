# frozen_string_literal: true

# Renders views that are not backed by database models.
class PagesController < ApplicationController
  # Renders the page based based on the given page parameter,
  # or renders the 404 error page if the page parameter is invalid.
  def show
    # Sanitize the page parameter to remove any dangerous characters!
    page = sanitize(params[:page])
    # Only render pages that are explicitly whitelisted.
    if ['home'].include? page
      render template: "pages/#{page}"
    else
      render file: 'public/404.html', status: :not_found
    end
  end
end
