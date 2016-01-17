class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.datetime :date
      t.integer :startAirport
      t.integer :finishAirport
      t.integer :duration

      t.timestamps null: false
    end
  end
end
