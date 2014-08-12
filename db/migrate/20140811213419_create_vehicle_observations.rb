class CreateVehicleObservations < ActiveRecord::Migration
  def change
    create_table :vehicle_observations do |t|
      t.string :address
      t.string :fuel
      t.string :interior
      t.string :exterior
      t.float :lat
      t.float :long
      t.belongs_to :location, index: true
      t.belongs_to :vehicle, index: true
      t.timestamps
    end
  end
end
