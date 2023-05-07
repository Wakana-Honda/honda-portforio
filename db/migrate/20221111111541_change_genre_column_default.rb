class ChangeGenreColumnDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :genres, :name, nil
  end
end
