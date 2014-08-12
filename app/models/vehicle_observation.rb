class VehicleObservation < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :observation
  has_one :location, through: :observation

  def coordinates=(json)
    self.long, self.lat = JSON.parse(json)
  end
end
