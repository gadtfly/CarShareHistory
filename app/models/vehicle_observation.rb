class VehicleObservation < ActiveRecord::Base
  belongs_to :observation
  belongs_to :vehicle

  def coordinates=(json)
    self.long, self.lat = JSON.parse(json)
  end
end
