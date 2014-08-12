class Vehicle < ActiveRecord::Base
  self.primary_key = :id
  has_many :vehicle_observations
  has_many :observations, through: :vehicle_observations
  has_many :locations, through: :observations
end
