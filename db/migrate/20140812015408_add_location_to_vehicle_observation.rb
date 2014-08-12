class AddLocationToVehicleObservation < ActiveRecord::Migration
  def change
    add_reference :vehicle_observations, :location, index: true
  end
end
