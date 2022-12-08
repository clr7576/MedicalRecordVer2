class CreateBasalValues < ActiveRecord::Migration[7.0]
  def change
    create_table :basal_values do |t|
      t.string :HR
      t.string :RR
      t.string :BP
      t.string :BT
      t.datetime :time
      t.datetime :deleted_at
      t.text :description
      t.belongs_to :animal, null: false, foreign_key: true

      t.timestamps
    end
    add_index :basal_values, :deleted_at
  end
end
