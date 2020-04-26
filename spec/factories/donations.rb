FactoryBot.define do
  factory :donation do
    user { nil }
    name { "MyText" }
    description { "MyText" }
    latitude { "9.99" }
    longitude { "9.99" }
    pickup_notes { "MyText" }
    available_until { "2020-04-26 13:44:42" }
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
    discarded_at { "2020-04-26 13:44:42" }
  end
end
