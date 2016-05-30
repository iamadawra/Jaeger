class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :username
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :birth_day
      t.integer :birth_month
      t.integer :birth_year
      t.string :address_1
      t.string :address_2
      t.string :zipcode
      t.string :country
      t.string :phone
      t.boolean :is_admin
      t.string :role
      t.string :activation_code

      t.timestamps null: false
    end
  end
end
