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

FactoryBot.define do
  factory :donation do
    name { 'MyText' }
    description { 'MyText' }
    fresh_until { '2020-01-19 18:05:19' }
    latitude { '9.99' }
    longitude { '9.99' }
    pickup_notes { 'MyText' }
    is_perishable { false }
    requires_preparation { false }
    is_vegetarian { false }
    is_vegan { false }
    is_gluten_free { false }
    contains_peanuts { false }
    contains_tree_nuts { false }
    contains_dairy { false }
    contains_soy { false }
    contains_egg { false }
    contains_fish { false }
    contains_shellfish { false }
  end
end
