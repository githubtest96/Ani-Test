class CreateHalls < ActiveRecord::Migration[5.0]
  def change
    create_table :halls do |t|
      t.references :cinema
      t.string :name
      t.integer :total_rows, null: false
      t.integer :total_columns, null: false

      t.timestamps
    end
  end
end
