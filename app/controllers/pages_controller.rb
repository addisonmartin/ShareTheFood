# Renders views that are not backed by database models.
class PagesController < ApplicationController

  # Renders the page based based on the given page parameter,
  # or renders the 404 error page if the page parameter is invalid.
  def show
    if valid_page?
      render template: "pages/#{params[:page]}"
    else
      render file: 'public/404.html', status: :not_found
    end
  end

  private

  # Returns true if the page parameter matches a file in app/views/pages/*.html.erb
  def valid_page?
    page_path = Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb")
    File.exist?(page_path)
  end

end