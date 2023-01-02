class CreateUrines < ActiveRecord::Migration[7.0]
  def change
    create_table :urines do |t|
      t.datetime :time
      t.integer :volume
      t.datetime :deleted_at
      t.belongs_to :animal, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
    add_index :urines, :deleted_at
  end
end
