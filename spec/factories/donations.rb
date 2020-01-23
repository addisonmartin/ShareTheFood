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
