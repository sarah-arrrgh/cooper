class CreateMembersCoops < ActiveRecord::Migration
  def change
    create_table :members_coops do |t|
      t.references :member, index: true, foreign_key: true
      t.references :coop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
