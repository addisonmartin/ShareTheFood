class Donation < ApplicationRecord
  # Enables tracking and storing changes to Donations.
  has_paper_trail
  # Enables soft deleting Donations.
  include Discard::Model

  # Configures Donations to belong to a User.
  belongs_to :user, inverse_of: :donations
end
