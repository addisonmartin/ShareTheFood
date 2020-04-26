class DonationPolicy < ApplicationPolicy
  # Any User can view Donation's index.
  def index?
    true
  end

  # Any User can view a Donation.
  def show?
    true
  end

  # Only signed in Users can create Donations.
  def create?
    user_signed_in?
  end

  # Only signed in Users can create Donations.
  def new?
    create?
  end

  # Only the creator of a Donation, or an admin User, can edit it.
  def update?
    (user.id == record.id) or user.admin?
  end

  # Only the creator of a Donation, or an admin User, can edit it.
  def edit?
    update?
  end

  # Only the creator of a Donation, or an admin User, can delete it.
  def destroy?
    (user.id == record.id) or user.admin?
  end
end