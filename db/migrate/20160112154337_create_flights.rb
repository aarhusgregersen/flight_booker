class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :startAirport
      t.string :finishAirport
      t.string :duration
      t.date :startdate

      t.timestamps null: false
    end
  end
end
