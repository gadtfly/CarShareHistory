class CreateVehicleObservations < ActiveRecord::Migration
  def change
    create_table :vehicle_observations do |t|
      t.string :address
      t.string :fuel
      t.string :interior
      t.string :exterior
      t.float :lat
      t.float :long
      t.belongs_to :observation, index: true
      t.string :vehicle_id, index: true
    end
  end
end
