class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :number
      t.date :join_date
      t.string :contact_number
      t.string :email

      t.timestamps null: false
    end
  end
end
