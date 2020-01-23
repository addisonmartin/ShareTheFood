# frozen_string_literal: true

# The database migration which creates the Donations table,
# with Donation's attributes.
class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.belongs_to :user, index: true
      t.foreign_key :users

      t.text :name, null: false
      t.text :description, null: false
      t.datetime :fresh_until, null: false
      t.decimal :latitude, precision: 10, scale: 6, null: false
      t.decimal :longitude, precision: 10, scale: 6, null: false
      t.text :pickup_notes, null: false
      t.boolean :is_perishable, null: false
      t.boolean :requires_preparation, null: false
      t.boolean :is_vegetarian, null: false
      t.boolean :is_vegan, null: false
      t.boolean :is_gluten_free, null: false
      t.boolean :contains_peanuts, null: false
      t.boolean :contains_tree_nuts, null: false
      t.boolean :contains_dairy, null: false
      t.boolean :contains_soy, null: false
      t.boolean :contains_egg, null: false
      t.boolean :contains_fish, null: false
      t.boolean :contains_shellfish, null: false

      t.timestamps
    end
  end
end
