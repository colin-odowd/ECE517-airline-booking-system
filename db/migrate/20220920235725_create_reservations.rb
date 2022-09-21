class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :ticket_class
      t.integer :class
      t.integer :amenities
      t.numeric :cost
      t.timestamps
    end
  end
end
