class CreatePriceLists < ActiveRecord::Migration
  def change
    create_table :price_lists do |t|
      t.date :EffectiveDate
      t.references :supplier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
