class VehicleObservation < ActiveRecord::Base
  belongs_to :location

  include HTTParty
  base_uri 'http://www.car2go.com/api/v2.0'

  def self.observe!(location)
    get('/vehicles', query: {loc: location.name, format: 'json'})['placemarks'].each do |vehicle|
      location.vehicle_observations.create(vehicle)
    end
  end

  def coordinates=(json)
    self.long, self.lat = JSON.parse(json)
  end
end
