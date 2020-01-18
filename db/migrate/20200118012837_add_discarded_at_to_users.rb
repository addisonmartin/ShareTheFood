class AddDiscardedAtToUsers < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_column :users, :discarded_at, :datetime
    # Algorithm concurrently prevents the entire table from locking while
    # adding this index.
    add_index :users, :discarded_at, algorithm: :concurrently
  end
end
