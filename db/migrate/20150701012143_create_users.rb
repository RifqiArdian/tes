class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.text :salt
      t.text :encrypted_password
      t.string :password
      t.boolean :status
      t.string :role

      t.timestamps null: false
    end
    add_index :users, :username, unique: true
  end
end
