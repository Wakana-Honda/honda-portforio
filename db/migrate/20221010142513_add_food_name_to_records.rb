class AddFoodNameToRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :records, :food_name, :string
  end
end
