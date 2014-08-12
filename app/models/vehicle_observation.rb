class VehicleObservation < ActiveRecord::Base
  include HTTParty
  base_uri 'http://www.car2go.com/api/v2.0'

  def self.observe!(location)
    get('/vehicles', query: {loc: location.name, format: 'json'})['placemarks'].each do |vehicle|
      create(vehicle)
    end
  end

  def coordinates=(json)
    self.long, self.lat = JSON.parse(json)
  end
end
