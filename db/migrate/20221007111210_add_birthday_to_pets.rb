class AddBirthdayToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :birthday, :date
  end
end
