class CreateBaggages < ActiveRecord::Migration[7.0]
  def change
    create_table :baggages do |t|
      t.integer :bag_reservation_id
      t.integer :weight

      t.timestamps
    end
    add_reference :baggages, :reservation, null: false, foreign_key: true
  end
end
