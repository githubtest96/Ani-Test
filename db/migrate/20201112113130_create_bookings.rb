class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :session, foreign_key: true
      t.integer :row, null: false
      t.integer :column, null: false

      t.timestamps
    end
  end
end
