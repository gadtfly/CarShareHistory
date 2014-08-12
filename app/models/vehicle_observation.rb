class VehicleObservation < ActiveRecord::Base
  belongs_to :location
  belongs_to :vehicle

  include HTTParty
  base_uri 'http://www.car2go.com/api/v2.0'

  def self.observe!(location)
    get('/vehicles', query: {loc: location.name, format: 'json'})['placemarks'].each do |placemark|
      vehicle = Vehicle.find_or_create_by(id: placemark.delete('vin'), license_plate: placemark.delete('name'))
      vehicle_observation = VehicleObservation.new(placemark)
      vehicle_observation.location = location
      vehicle_observation.vehicle = vehicle
      vehicle_observation.save
    end
  end

  def coordinates=(json)
    self.long, self.lat = JSON.parse(json)
  end
end
