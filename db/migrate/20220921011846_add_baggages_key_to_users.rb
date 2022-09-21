class AddBaggagesKeyToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :baggages, null: false, foreign_key: true
  end
end
