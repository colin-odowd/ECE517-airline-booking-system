class AddKeysToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :reservations, null: false, foreign_key: true
  end
end
