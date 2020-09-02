# frozen_string_literal: true

# == Schema Information
#
# Table name: donations
#
#  id                   :bigint           not null, primary key
#  address              :text
#  available_until      :datetime         not null
#  contains_dairy       :boolean          not null
#  contains_egg         :boolean          not null
#  contains_fish        :boolean          not null
#  contains_gluten      :boolean          not null
#  contains_peanuts     :boolean          not null
#  contains_shellfish   :boolean          not null
#  contains_soy         :boolean          not null
#  contains_tree_nuts   :boolean          not null
#  description          :text
#  discarded_at         :boolean
#  is_halal             :boolean          not null
#  is_kosher            :boolean          not null
#  is_perishable        :boolean          not null
#  is_vegan             :boolean          not null
#  is_vegetarian        :boolean          not null
#  latitude             :decimal(10, 6)   not null
#  longitude            :decimal(10, 6)   not null
#  name                 :text             not null
#  pickup_notes         :text             not null
#  requires_preparation :boolean          not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :bigint           not null
#  visit_id             :bigint
#
# Indexes
#
#  index_donations_on_latitude_and_longitude  (latitude,longitude)
#  index_donations_on_user_id                 (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Donation < ApplicationRecord
  belongs_to :user, inverse_of: :donations

  has_many_attached :images

  # Enables soft deleting donations (a donation is marked as deleted, but not actually deleted).
  include Discard::Model

  # Tracks and stores changes to donations.
  has_paper_trail

  # Lookup the nearest address to the donation's location.
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  # Links the user analytic visit when the user created the donation to the donation.
  visitable :visit, class_name: 'Visit'

  validates :user, :name, :available_until, :latitude, :longitude, :pickup_notes, presence: true
  validates :is_perishable, :requires_preparation, :is_vegetarian, :is_vegan, :is_kosher, :is_halal,
            :contains_gluten, :contains_peanuts, :contains_tree_nuts, :contains_dairy, :contains_soy,
            :contains_egg, :contains_fish, :contains_shellfish, inclusion: { in: [true, false] }
  # Validates that latitude and longitude are valid latitude/longitude coordinates on Earth.
  validates :latitude, inclusion: { in: -90..90, message: 'must be between -90 and 90.' }
  validates :longitude, inclusion: { in: -180..180, message: 'must be between -180 and 180.' }
end
