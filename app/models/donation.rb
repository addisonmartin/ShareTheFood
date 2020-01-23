# frozen_string_literal: true

# == Schema Information
#
# Table name: donations
#
#  id                   :bigint           not null, primary key
#  contains_dairy       :boolean          not null
#  contains_egg         :boolean          not null
#  contains_fish        :boolean          not null
#  contains_peanuts     :boolean          not null
#  contains_shellfish   :boolean          not null
#  contains_soy         :boolean          not null
#  contains_tree_nuts   :boolean          not null
#  description          :text             not null
#  discarded_at         :datetime
#  fresh_until          :datetime         not null
#  is_gluten_free       :boolean          not null
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
#  user_id              :bigint
#
# Indexes
#
#  index_donations_on_discarded_at  (discarded_at)
#  index_donations_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
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

  # Requires that latitude/longitude are valid coordinates on Earth.
  validates :latitude, inclusion: { in: -90..90,
                                    message:
                                    'Latitude must be between -90 and 90.' }
  validates :longitude, inclusion: { in: -180..180,
                                     message:
                                     'Longitude must be between -180 and 180.' }
end
