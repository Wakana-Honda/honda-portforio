class AddEndUserIdToRecord < ActiveRecord::Migration[6.1]
  def change
    add_column :records, :end_user_id, :integer
  end
end
