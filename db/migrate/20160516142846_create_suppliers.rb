class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.references :user, index: true
      t.string :name
      t.string :guild
      t.string :email
      t.string :address
      t.integer :zip_code
      t.string :city
      t.string :state
      t.string :country
      t.integer :phone_number_1
      t.integer :phone_number_2
      t.integer :fax_number
      t.string :web_page
      t.integer :user_valoration
      t.integer :budget_valoration
      t.integer :fixes_percentage_valoration

      t.timestamps null: false
    end
  end
end
