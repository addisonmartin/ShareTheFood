# frozen_string_literal: true

class AdminDashboardPolicy < Struct.new(:user, :admin_dashboard)
  # Only admin Users are allowed to view the admin dashboard.
  def show?
    !user.nil? && user.admin?
  end
end
