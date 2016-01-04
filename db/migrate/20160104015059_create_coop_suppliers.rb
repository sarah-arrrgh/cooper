class CreateCoopSuppliers < ActiveRecord::Migration
  def change
    create_table :coop_suppliers do |t|
      t.references :coop, index: true, foreign_key: true
      t.references :supplier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
