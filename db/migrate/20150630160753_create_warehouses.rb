class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
    	t.integer :warehouse_id
    	t.string :warehouse_name
    	t.string :address
    	t.string :phone
    	t.string :code
    	t.string :distributor_id

      t.timestamps null: false
    end
  end
end
