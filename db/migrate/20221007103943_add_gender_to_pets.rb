class AddGenderToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :gender, :integer
  end
end
