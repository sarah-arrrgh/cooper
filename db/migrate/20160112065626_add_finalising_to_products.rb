class AddFinalisingToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :finalising, index: true, foreign_key: true
  end
end
