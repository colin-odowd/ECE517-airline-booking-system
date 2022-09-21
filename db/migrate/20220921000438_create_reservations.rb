class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :confirmation_number
      t.string :ticket_class
      t.integer :class
      t.integer :amenities
      t.numeric :cost
      
      t.timestamps
    end
    add_index :reservations, :confirmation_number, unique: true
    add_reference :reservations, :user, null: false, foreign_key: true
    add_reference :reservations, :flight, null: false, foreign_key: true
  end
end
