class AdminDashboardPolicy < Struct.new(:user, :admin_dashboard)

  # Only admin Users are allowed to view the admin dashboard.
  def show?
    (not user.nil?) and user.admin?
  end

end