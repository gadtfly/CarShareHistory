class CreateVehicleObservations < ActiveRecord::Migration
  def change
    create_table :vehicle_observations do |t|
      t.string :name
      t.string :vin
      t.string :address
      t.string :fuel
      t.string :interior
      t.string :exterior
      t.float :lat
      t.float :long
      t.timestamps
    end
  end
end
