class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :name
      t.string :credit_card
      t.string :address
      t.string :mobile
      t.string :email
      t.boolean :admin

      t.timestamps
    end
  end
end
