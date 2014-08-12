class Observation < ActiveRecord::Base
  belongs_to :location
  has_many :vehicle_observations
  has_many :vehicles, through: :vehicle_observations
end
