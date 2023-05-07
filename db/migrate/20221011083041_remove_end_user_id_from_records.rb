class RemoveEndUserIdFromRecords < ActiveRecord::Migration[6.1]
  def change
    remove_column :records, :end_user_id, :integer
  end
end
