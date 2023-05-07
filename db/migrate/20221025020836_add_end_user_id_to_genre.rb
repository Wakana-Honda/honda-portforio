class AddEndUserIdToGenre < ActiveRecord::Migration[6.1]
  def change
    add_column :genres, :end_user_id, :integer
  end
end
