class Location < ActiveRecord::Base
  has_many :observations
  has_many :vehicle_observations, through: :observations
  has_many :vehicles, through: :vehicle_observations

  def self.refresh!
    Car2Go.locations.each do |hash|
      find_or_create_by(id: hash['locationId'], name: hash['locationName'])
    end
  end

  def self.observe!
    all.each(&:observe!)
  end

  def observe!
    observation = observations.create
    Car2Go.vehicles(name).each do |hash|
      vehicle = Vehicle.find_or_create_by(id: hash.delete('vin'), license_plate: hash.delete('name'))
      VehicleObservation.create(hash.merge(observation: observation, vehicle: vehicle))
    end
  end
end
