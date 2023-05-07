class AddEndUserIdToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :end_user_id, :integer
  end
end
