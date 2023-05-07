class ChangeDataAmountToRecords < ActiveRecord::Migration[6.1]
  def change
   change_column :records, :amount, :string
  end
end
