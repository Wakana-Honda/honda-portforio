class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.integer :type_id
      t.integer :genre_id
      t.string :name
      t.string :food_image
      t.text :memo
      t.timestamps
    end
  end
end
