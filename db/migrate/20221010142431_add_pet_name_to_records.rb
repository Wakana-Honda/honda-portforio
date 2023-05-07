class AddPetNameToRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :records, :pet_name, :string
  end
end
