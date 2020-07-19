# frozen_string_literal: true

class PagesController < ApplicationController
  # Configure the about page to be cached.
  caches_page :about

  def about; end

  def admin
    # Only admin Users are allowed to view the admin dashboard page.
    authorize :admin_dashboard, :show?

    @donations = Donation.all
    @users = User.all
    @visits = Ahoy::Visit.all

    # Pass the User visits per state to Javascript, for display on the US map chart.
    gon.visits_per_state = @visits.group(:region).count
  end
end
