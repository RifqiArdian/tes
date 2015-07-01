class CreateDistributors < ActiveRecord::Migration
  def change
    create_table :distributors do |t|
    	t.integer :distributor_id
    	t.string :distributor_name
    	t.string :address
    	t.string :phone1
    	t.string :phone2
    	t.string :email
    	t.string :fax

      t.timestamps null: false
    end
  end
end
