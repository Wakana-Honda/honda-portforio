class AddEndUserIdToFoods < ActiveRecord::Migration[6.1]
  def change
    add_column :foods, :end_user_id, :integer
  end
end
