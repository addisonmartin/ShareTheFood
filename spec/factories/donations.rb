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

require 'faker'

FactoryBot.define do
  factory :donation do
    user { create(:user) }

    name { Faker::Food.dish }
    description { Faker::Food.description }
    latitude { rand(-90..90) }
    longitude { rand(-180..180) }
    pickup_notes { Faker::Lorem.sentence }
    available_until { Faker::Time.between(from: DateTime.now, to: DateTime.now + 3.months) }
    is_perishable { Faker::Boolean.boolean }
    requires_preparation { Faker::Boolean.boolean }
    is_vegetarian { Faker::Boolean.boolean }
    is_vegan { Faker::Boolean.boolean }
    is_kosher { Faker::Boolean.boolean }
    is_halal { Faker::Boolean.boolean }
    contains_gluten { Faker::Boolean.boolean }
    contains_peanuts { Faker::Boolean.boolean }
    contains_tree_nuts { Faker::Boolean.boolean }
    contains_dairy { Faker::Boolean.boolean }
    contains_soy { Faker::Boolean.boolean }
    contains_egg { Faker::Boolean.boolean }
    contains_fish { Faker::Boolean.boolean }
    contains_shellfish { Faker::Boolean.boolean }
  end
end
