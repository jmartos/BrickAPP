class CreateSupplierReviews < ActiveRecord::Migration
  def change
    create_table :supplier_reviews do |t|
      t.references :work, index: true
      t.references :supplier, index: true
      t.integer :projected_budget
      t.integer :final_budget
      t.integer :user_valoration

      t.timestamps null: false
    end
  end
end
