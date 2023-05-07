class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.date :age
      t.date :birthday
      t.boolean :gender
      t.text :memo
      t.string :pet_image
      t.timestamps
    end
  end
end
