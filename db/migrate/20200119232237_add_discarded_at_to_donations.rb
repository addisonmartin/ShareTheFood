class AddDiscardedAtToDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :discarded_at, :datetime
    add_index :donations, :discarded_at
  end
end
