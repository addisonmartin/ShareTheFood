# frozen_string_literal: true

# The database migration which creates the Donations table,
# with Donation's attributes.
class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.text :name, null: false
      t.text :description, null: false
      t.datetime :fresh_until, null: false
      t.decimal :latitude, precision: 10, scale: 6, null: false
      t.decimal :longitude, precision: 10, scale: 6, null: false
      t.text :pickup_notes, null: false
      t.boolean :is_perishable
      t.boolean :requires_preparation
      t.boolean :is_vegetarian
      t.boolean :is_vegan
      t.boolean :is_gluten_free
      t.boolean :contains_peanuts
      t.boolean :contains_tree_nuts
      t.boolean :contains_dairy
      t.boolean :contains_soy
      t.boolean :contains_egg
      t.boolean :contains_fish
      t.boolean :contains_shellfish

      t.timestamps
    end
  end
end
