# frozen_string_literal: true
class DonationPolicy < ApplicationPolicy
  # Everyone can view all donations.
  def index?
    true
  end

  # Everyone can view a donation.
  def show?
    true
  end

  # Only signed in users can create a donation.
  def create?
    not user.nil?
  end

  # Only the owner of a donation, or an admin user, can update a donation.
  def update?
    (record.user == user) or user.try(:admin?)
  end

  # Only the owner of a donation, or an admin user, can destroy a donation.
  def destroy?
    (record.user == user) or user.try(:admin?)
  end
end
