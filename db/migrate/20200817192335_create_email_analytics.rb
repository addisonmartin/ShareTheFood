# frozen_string_literal: true

class CreateEmailAnalytics < ActiveRecord::Migration[6.0]
  def change
    create_table :email_analytics do |t|
      t.references :user, polymorphic: true
      t.text :to
      t.string :mailer
      t.text :subject
      t.timestamp :sent_at

      # Used to track email opens and link clicks.
      t.string :token
      t.timestamp :opened_at
      t.timestamp :clicked_at
    end

    add_index :email_analytics, :token
  end
end
