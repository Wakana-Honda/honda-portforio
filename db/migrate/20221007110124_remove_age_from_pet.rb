class RemoveAgeFromPet < ActiveRecord::Migration[6.1]
  def change
    remove_column :pets, :age, :date
  end
end
