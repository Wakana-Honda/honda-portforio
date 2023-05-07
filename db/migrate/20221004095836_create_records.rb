class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.integer :pet_id
      t.integer :food_id
      t.integer :amount
      t.text :memo
      t.timestamps
    end
  end
end
