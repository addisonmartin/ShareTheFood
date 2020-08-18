# frozen_string_literal: true
class PagesController < ApplicationController
  def about
    # Ensure the user is allowed to perform this action.
    authorize :page, :about?
  end
end