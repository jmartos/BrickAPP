class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.references :user, index: true
      t.string :code
      t.string :name
      t.string :address
      t.integer :zip_code
      t.string :city
      t.string :state
      t.string :country
      t.string :client
      t.integer :client_phone
      t.string :client_email
      t.string :client_address

      t.timestamps null: false
    end
  end
end
