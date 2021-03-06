# frozen_string_literal: true

# == Schema Information
#
# Table name: donations
#
#  id                   :bigint(8)        not null, primary key
#  available_until      :datetime         not null
#  contains_dairy       :boolean          default(FALSE)
#  contains_egg         :boolean          default(FALSE)
#  contains_fish        :boolean          default(FALSE)
#  contains_gluten      :boolean          default(FALSE)
#  contains_peanuts     :boolean          default(FALSE)
#  contains_shellfish   :boolean          default(FALSE)
#  contains_soy         :boolean          default(FALSE)
#  contains_tree_nuts   :boolean          default(FALSE)
#  description          :text             default("")
#  discarded_at         :datetime
#  is_perishable        :boolean          default(FALSE)
#  is_vegan             :boolean          default(FALSE)
#  is_vegetarian        :boolean          default(FALSE)
#  latitude             :decimal(10, 6)   not null
#  longitude            :decimal(10, 6)   not null
#  name                 :text             not null
#  pickup_notes         :text             not null
#  requires_preparation :boolean          default(FALSE)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :bigint(8)        not null
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
  # Enables tracking and storing changes to Donations.
  has_paper_trail
  # Enables soft deleting Donations.
  include Discard::Model

  # Enables searching this model's text attributes with Postgres' built-in full text search.
  include PgSearch::Model
  pg_search_scope :search, against: %i[name
                                       description
                                       pickup_notes],
                           associated_against: { user: :email },
                           using: { dmetaphone: {},
                                    trigram: {
                                      word_similarity: true
                                    },
                                    tsearch: { prefix: true,
                                               any_word: true,
                                               dictionary: 'english' } },
                           ignoring: :accents

  # This scope only returns Donation's where their available until time is after the current time.
  scope :available, -> { where('available_until >= ?', Time.zone.now) }

  # Enables uploading and attaching images to Donations.
  has_many_attached :images

  # Configures Donations to belong to a User.
  belongs_to :user, inverse_of: :donations

  # Requires that these attributes be present in every Donation:
  validates :user, :name, :available_until, :latitude, :longitude, :pickup_notes, presence: true

  # Requires that these attributes be a valid boolean:
  validates :is_perishable, :requires_preparation, :is_vegetarian, :is_vegan, :contains_gluten, :contains_peanuts,
            :contains_tree_nuts, :contains_dairy, :contains_soy, :contains_egg, :contains_fish, :contains_shellfish,
            inclusion: { in: [true, false] }

  # Requires that latitude and longitude be valid latitude/longitude coordinates on Earth:
  validates :latitude, inclusion: { in: -90..90, message: 'must be between -90 and 90.' }
  validates :longitude, inclusion: { in: -180..180, message: 'must be between -180 and 180.' }
end
