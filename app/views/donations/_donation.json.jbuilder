# frozen_string_literal: true

json.extract! donation, :id, :user_id, :name, :description, :latitude, :longitude, :pickup_notes,
              :available_until, :is_perishable, :requires_preparation, :is_vegetarian, :is_vegan, :is_kosher, :is_halal,
              :contains_gluten, :contains_peanuts, :contains_tree_nuts, :contains_dairy, :contains_soy, :contains_egg,
              :contains_fish, :contains_shellfish, :visit_id, :discarded_at, :created_at, :updated_at

json.url donation_url(donation, format: :json)
