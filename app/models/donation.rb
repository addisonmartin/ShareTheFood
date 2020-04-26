class Donation < ApplicationRecord
  # Configures Donations to belong to a User.
  belongs_to :user, inverse_of: :donations

  # Configures Donations to keep track of User Visits, for analytics.
  visitable :ahoy_visit
end
