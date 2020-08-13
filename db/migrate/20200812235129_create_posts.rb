class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, null: false, foreign_key: true

      t.text :title
      t.text :subtitle
      t.boolean :published

      # Used as part of the URL when viewing a post.
      t.string :slug, index: true, unique: true

      # Used to mark this post as deleted.
      t.datetime :discarded_at
      # Creates the created_at/updated_at columns.
      t.timestamps
    end
  end
end
