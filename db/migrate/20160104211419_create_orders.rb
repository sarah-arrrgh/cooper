class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :qty
      t.date :order_date
      t.references :product, index: true, foreign_key: true
      t.references :member, index: true, foreign_key: true
      t.integer :status

      t.timestamps null: false
    end
  end
end
