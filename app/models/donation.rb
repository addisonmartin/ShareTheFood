class Donation < ApplicationRecord
  # Configures Donations to belong to a User.
  belongs_to :user, inverse_of: :donations
end
