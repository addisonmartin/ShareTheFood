class Donation < ApplicationRecord
  # Enables tracking and storing changes to Donations.
  has_paper_trail
  # Enables soft deleting Donations.
  include Discard::Model

  # Configures Donations to belong to a User.
  belongs_to :user, inverse_of: :donations

  # Requires that these attributes be present in every Donation:
  validates :user, :name, :available_until, :latitude, :longitude, :pickup_notes, presence: true

  # Requires that these attributes be a valid boolean:
  validates :is_perishable, :requires_preparation, :is_vegetarian, :is_vegan, :is_gluten_free, :contains_peanuts,
            :contains_tree_nuts, :contains_dairy, :contains_soy, :contains_egg, :contains_fish, :contains_shellfish,
            inclusion: { in: [true, false] }

  # Requires that latitude and longitude be valid latitude/longitude coordinates on Earth:
  validates :latitude, inclusion: { in: -90..90, message: 'Latitude must be between -90 and 90.' }
  validates :longitude, inclusion: { in: -180..180, message: 'Longitude must be between -180 and 180.' }
end
