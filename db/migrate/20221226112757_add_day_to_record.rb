class AddDayToRecord < ActiveRecord::Migration[6.1]
  def change
    add_column :records, :day, :date
  end
end
