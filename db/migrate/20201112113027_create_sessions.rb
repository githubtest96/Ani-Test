class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.references :cinema
      t.references :film
      t.references :hall
      t.datetime :start_date, null: false

      t.timestamps
    end
  end
end
