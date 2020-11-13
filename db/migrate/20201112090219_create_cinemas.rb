class CreateCinemas < ActiveRecord::Migration[5.0]
  def change
    create_table :cinemas do |t|
      t.integer :cinema_id, null: false
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
