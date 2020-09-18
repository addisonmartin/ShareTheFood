# frozen_string_literal: true

# The controller for pages. Connects incoming requests to models and views.
class PagesController < ApplicationController
  def about
    # Ensure the user is allowed to perform this action.
    authorize :page, :about?
  end
end
