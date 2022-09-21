class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :name
      t.string :credit_card
      t.string :address
      t.string :mobile
      t.string :email

      t.timestamps
    end
    add_index :users, :user_id, unique: true
  end
end
