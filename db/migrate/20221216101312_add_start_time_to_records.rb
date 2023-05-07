class AddStartTimeToRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :records, :start_time, :datetime
  end
end
