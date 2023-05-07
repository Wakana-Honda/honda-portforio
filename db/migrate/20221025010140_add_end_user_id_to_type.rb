class AddEndUserIdToType < ActiveRecord::Migration[6.1]
  def change
    add_column :types, :end_user_id, :integer
  end
end
