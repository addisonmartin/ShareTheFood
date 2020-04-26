class PagesController < ApplicationController
  def about
  end

  def admin
    # Only admin Users are allowed to view the admin dashboard page.
    authorize :admin_dashboard, :show?

    @donations = Donation.all
    @users = User.all
  end
end
