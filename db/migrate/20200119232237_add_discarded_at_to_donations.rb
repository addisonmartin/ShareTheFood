# frozen_string_literal: true

# Adds ability to soft delete this model with discard.
class AddDiscardedAtToDonations < ActiveRecord::Migration[6.0]
  # Prevents the entire table from locking when adding this index.
  disable_ddl_transaction!

  def change
    add_column :donations, :discarded_at, :datetime
    add_index :donations, :discarded_at, algorithm: :concurrently
  end
end
