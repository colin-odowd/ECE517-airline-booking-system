class CreateBaggages < ActiveRecord::Migration[7.0]
  def change
    create_table :baggages do |t|
      t.string :baggage_id
      t.integer :weight
      t.integer :cost

      t.timestamps
    end
    add_index :baggages, :baggage_id, unique: true
    add_reference :baggages, :user, null: false, foreign_key: true
    add_reference :baggages, :reservation, null: false, foreign_key: true
  end
end
