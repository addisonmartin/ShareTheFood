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
#  description          :text
#  discarded_at         :datetime
#  fresh_until          :datetime
#  is_gluten_free       :boolean
#  is_perishable        :boolean
#  is_vegan             :boolean
#  is_vegetarian        :boolean
#  latitude             :decimal(10, 6)
#  longitude            :decimal(10, 6)
#  name                 :text
#  pickup_notes         :text
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
end
