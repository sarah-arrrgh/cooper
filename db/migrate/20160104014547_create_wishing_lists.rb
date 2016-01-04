class CreateWishingLists < ActiveRecord::Migration
  def change
    create_table :wishing_lists do |t|
      t.decimal :qty
      t.references :member, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
