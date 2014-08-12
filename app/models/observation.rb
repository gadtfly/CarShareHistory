class Observation < ActiveRecord::Base
  belongs_to :location
  has_many :vehicle_observations
end
