# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
# rubocop:disable Rails/CreateTableWithTimestamps

# Creates the database tables where analytics are stored.
class CreateAhoyVisitsAndEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :ahoy_visits do |t|
      t.string :visit_token
      t.string :visitor_token

      # User
      t.references :user

      # Standard
      t.string :ip
      t.text :user_agent
      t.text :referrer
      t.string :referring_domain
      t.text :landing_page

      # Technology
      t.string :browser
      t.string :os
      t.string :device_type

      # Location
      t.string :country
      t.string :region
      t.string :city
      t.float :latitude
      t.float :longitude

      # utm arameters
      t.string :utm_source
      t.string :utm_medium
      t.string :utm_term
      t.string :utm_content
      t.string :utm_campaign

      # Native apps
      t.string :app_version
      t.string :os_version
      t.string :platform

      t.timestamp :started_at
    end

    add_index :ahoy_visits, [:visit_token], unique: true

    create_table :ahoy_events do |t|
      t.references :visit
      t.references :user

      t.string :name
      t.jsonb :properties
      t.timestamp :time
    end

    add_index :ahoy_events, %i[name time]
    add_index :ahoy_events, :properties, using: :gin, opclass: :jsonb_path_ops
  end
end

# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
# rubocop:enable Rails/CreateTableWithTimestamps
