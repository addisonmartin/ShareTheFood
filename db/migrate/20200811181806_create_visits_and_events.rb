# frozen_string_literal: true

class CreateVisitsAndEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      # Required columns:

      t.string :visit_token
      t.string :visitor_token

      # Optional columns:

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
      t.string :accept_language
      t.string :country
      t.string :region
      t.string :city
      t.float :latitude
      t.float :longitude

      # UTM Parameters
      t.string :utm_source
      t.string :utm_medium
      t.string :utm_term
      t.string :utm_content
      t.string :utm_campaign

      # Native Apps
      t.string :app_version
      t.string :os_version
      t.string :platform

      t.timestamp :started_at
    end

    add_index :visits, [:visit_token], unique: true

    create_table :events do |t|
      t.references :visit, foreign_key: true
      t.references :user

      t.string :name
      t.jsonb :properties
      t.timestamp :time
    end

    add_index :events, [:name, :time]
    add_index :events, :properties, using: :gin, opclass: :jsonb_path_ops
  end
end
