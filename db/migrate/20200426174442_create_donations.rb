class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      # Configures Donations to belong to a User.
      t.belongs_to :user, null: false, foreign_key: true

      t.text :name, null: false
      t.text :description, default: ''
      t.decimal :latitude, precision: 10, scale: 6, null: false
      t.decimal :longitude, precision: 10, scale: 6, null: false
      t.text :pickup_notes, null: false
      t.datetime :available_until, null: false
      t.boolean :is_perishable, default: false
      t.boolean :requires_preparation, default: false
      t.boolean :is_vegetarian, default: false
      t.boolean :is_vegan, default: false
      t.boolean :is_gluten_free, default: false
      t.boolean :contains_peanuts, default: false
      t.boolean :contains_tree_nuts, default: false
      t.boolean :contains_dairy, default: false
      t.boolean :contains_soy, default: false
      t.boolean :contains_egg, default: false
      t.boolean :contains_fish, default: false
      t.boolean :contains_shellfish, default: false

      # Used to enable soft deleting of Donations.
      t.datetime :discarded_at, index: true
      # Creates the created_at/updated_at datetime columns.
      t.timestamps
    end
  end
end
