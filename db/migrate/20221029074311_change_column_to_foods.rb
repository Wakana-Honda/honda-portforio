class ChangeColumnToFoods < ActiveRecord::Migration[6.1]
  def change
    change_column_null :foods, :type_id, true
    change_column_null :foods, :genre_id, true
  end
end
