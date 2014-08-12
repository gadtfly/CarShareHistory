class Vehicle < ActiveRecord::Base
  self.primary_key = :id
  has_many :vehicle_observations
end
