# frozen_string_literal: true

# == Schema Information
#
# Table name: donations
#
#  id                   :bigint           not null, primary key
#  contains_dairy       :boolean
#  contains_egg         :boolean
#  contains_fish        :boolean
#  contains_peanuts     :boolean
#  contains_shellfish   :boolean
#  contains_soy         :boolean
#  contains_tree_nuts   :boolean
#  description          :text             not null
#  discarded_at         :datetime
#  fresh_until          :datetime         not null
#  is_gluten_free       :boolean
#  is_perishable        :boolean
#  is_vegan             :boolean
#  is_vegetarian        :boolean
#  latitude             :decimal(10, 6)   not null
#  longitude            :decimal(10, 6)   not null
#  name                 :text             not null
#  pickup_notes         :text             not null
#  requires_preparation :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_donations_on_discarded_at  (discarded_at)
#
class Donation < ApplicationRecord
  # Tracks changes to this model.
  has_paper_trail

  # Enables soft deleting this model.
  include Discard::Model

  belongs_to :user, inverse_of: :donations

  # Enables attaching one or more images to this model.
  has_many_attached :images

  # Requires that these attributes be present in the donation.
  validates :user, :name, :description, :fresh_until, :latitude, :longitude,
            :pickup_notes, presence: true

  # Requires that these attributes be a valid boolean.
  validates :is_perishable, :requires_preparation, :is_vegetarian, :is_vegan,
            :is_gluten_free, :contains_peanuts, :contains_tree_nuts,
            :contains_dairy, :contains_soy, :contains_egg, :contains_fish,
            :contains_shellfish, inclusion: { in: [true, false] }

  # Requires that latitude is a valid coordinate on Earth.
  validates :latitude, inclusion: { in: -90..90,
                                    message:
                                    'Latitude must be between -90 and 90.' }

  # Requires that longitude is a valid coordinate on Earth.
  validates :longitude, inclusion: { in: -180..180,
                                     message:
                                     'Longitude must be between -180 and 180.' }
end
