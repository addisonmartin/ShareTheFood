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

require 'faker'

FactoryBot.define do
  factory :donation do
    user
    name { Faker::String.random(length: 1..5096).delete("\u0000") }
    description { Faker::String.random(length: 1..5096).delete("\u0000") }
    latitude { rand(-90..90) }
    longitude { rand(-180..180) }
    pickup_notes { Faker::String.random(length: 1..5096).delete("\u0000") }
    available_until { Faker::Time.between(from: DateTime.now - 60.days, to: DateTime.now + 60.days) }
    is_perishable { Faker::Boolean.boolean }
    requires_preparation { Faker::Boolean.boolean }
    is_vegetarian { Faker::Boolean.boolean }
    is_vegan { Faker::Boolean.boolean }
    contains_gluten { Faker::Boolean.boolean }
    contains_peanuts { Faker::Boolean.boolean }
    contains_tree_nuts { Faker::Boolean.boolean }
    contains_dairy { Faker::Boolean.boolean }
    contains_soy { Faker::Boolean.boolean }
    contains_egg { Faker::Boolean.boolean }
    contains_fish { Faker::Boolean.boolean }
    contains_shellfish { Faker::Boolean.boolean }
  end

  factory :other_donation, class: 'Donation' do
    other_user
    name { Faker::String.random(length: 1..5096).delete("\u0000") }
    description { Faker::String.random(length: 1..5096).delete("\u0000") }
    latitude { rand(-90..90) }
    longitude { rand(-180..180) }
    pickup_notes { Faker::String.random(length: 1..5096).delete("\u0000") }
    available_until { Faker::Time.between(from: DateTime.now - 60.days, to: DateTime.now + 60.days) }
    is_perishable { Faker::Boolean.boolean }
    requires_preparation { Faker::Boolean.boolean }
    is_vegetarian { Faker::Boolean.boolean }
    is_vegan { Faker::Boolean.boolean }
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
