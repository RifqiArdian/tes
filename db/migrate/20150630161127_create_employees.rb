class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
    	t.integer :employee_id
    	t.string :email
    	t.string :fullname
    	t.string :address
    	t.string :nirthdate
    	t.string :joindate
    	t.string :phone
    	t.string :mobile
    	t.string :distributor_id
    	t.string :warehouse_id
      t.timestamps null: false
    end
  end
end
