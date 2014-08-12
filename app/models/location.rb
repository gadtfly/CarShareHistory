class Location < ActiveRecord::Base
  has_many :observations

  include HTTParty
  base_uri 'http://www.car2go.com/api/v2.0'

  def self.refresh_all!
    get('/locations', query: {format: 'json'})['location'].each do |location|
      find_or_create_by(id: location['locationId'], name: location['locationName'])
    end
  end

  def observe!
    observation = observations.create
    self.class.get('/vehicles', query: {loc: name, format: 'json'})['placemarks'].each do |placemark|
      vehicle     = Vehicle.find_or_create_by(id: placemark.delete('vin'), license_plate: placemark.delete('name'))
      vehicle_observation = VehicleObservation.new(placemark)
      vehicle_observation.observation = observation
      vehicle_observation.vehicle     = vehicle
      vehicle_observation.save
    end
  end
end
