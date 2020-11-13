class CreateFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :films do |t|
      t.references :cinema
      t.string :name
      t.time :duration

      t.timestamps
    end
  end
end
