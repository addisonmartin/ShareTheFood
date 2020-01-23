# frozen_string_literal: true

# Adds ability to soft delete this model with discard.
class AddDiscardedAtToUsers < ActiveRecord::Migration[6.0]
  # Prevents the entire table from locking when adding this index.
  disable_ddl_transaction!

  def change
    add_column :users, :discarded_at, :datetime
    add_index :users, :discarded_at, algorithm: :concurrently
  end
end
