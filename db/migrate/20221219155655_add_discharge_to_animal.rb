class AddDischargeToAnimal < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :discharge, :string, :default => "hospitalization"
    add_index :animals, :discharge
  end
end
