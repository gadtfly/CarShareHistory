class Location < ActiveRecord::Base
  include HTTParty
  base_uri 'http://www.car2go.com/api/v2.0'

  def self.refresh_all!
    get('/locations', query: {format: 'json'})['location'].each do |location|
      find_or_create_by(id: location['locationId'], name: location['locationName'])
    end
  end

  def observe!
    VehicleObservation.observe!(self)
  end
end
