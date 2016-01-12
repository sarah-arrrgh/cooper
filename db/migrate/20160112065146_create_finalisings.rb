class CreateFinalisings < ActiveRecord::Migration
  def change
    create_table :finalisings do |t|
      t.date :final_date
      t.references :coop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
