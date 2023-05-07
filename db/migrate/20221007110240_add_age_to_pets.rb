class AddAgeToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :age, :integer
  end
end
