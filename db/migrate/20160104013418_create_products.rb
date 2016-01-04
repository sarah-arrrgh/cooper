class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_code
      t.string :description
      t.string :unit
      t.decimal :qty_outer
      t.decimal :qty_min

      t.timestamps null: false
    end
  end
end
