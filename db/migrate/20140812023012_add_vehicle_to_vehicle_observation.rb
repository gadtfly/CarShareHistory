class AddVehicleToVehicleObservation < ActiveRecord::Migration
  def change
    add_reference :vehicle_observations, :vehicle, index: true
  end
end
