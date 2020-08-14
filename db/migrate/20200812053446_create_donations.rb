class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.belongs_to :user, null: false, foreign_key: true

      t.text :name, null: false
      t.text :description
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false
      t.text :pickup_notes, null: false
      t.datetime :available_until, null: false
      t.boolean :is_perishable, null: false
      t.boolean :requires_preparation, null: false
      t.boolean :is_vegetarian, null: false
      t.boolean :is_vegan, null: false
      t.boolean :is_kosher, null: false
      t.boolean :is_halal, null: false
      t.boolean :contains_gluten, null: false
      t.boolean :contains_peanuts, null: false
      t.boolean :contains_tree_nuts, null: false
      t.boolean :contains_dairy, null: false
      t.boolean :contains_soy, null: false
      t.boolean :contains_egg, null: false
      t.boolean :contains_fish, null: false
      t.boolean :contains_shellfish, null: false

      t.bigint :visit_id

      # Used to mark this donation as deleted.
      t.boolean :discarded_at
      # Creates the created_at/updated_at columns.
      t.timestamps
    end
  end
end
