class CreateAnimals < ActiveRecord::Migration[7.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.string :number
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :animals, :deleted_at
  end
end
