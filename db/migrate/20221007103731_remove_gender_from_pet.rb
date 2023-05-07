class RemoveGenderFromPet < ActiveRecord::Migration[6.1]
  def change
    remove_column :pets, :gender, :boolean
  end
end
