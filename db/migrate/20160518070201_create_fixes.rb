class CreateFixes < ActiveRecord::Migration
  def change
    create_table :fixes do |t|
      t.references :work, index: true
      t.references :supplier, index: true
      t.integer :code
      t.attachment :picture
      t.string :localization
      t.string :comment
      t.boolean :check, :default => false

      t.timestamps null: false
    end
  end
end
