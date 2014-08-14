class Car2Go
  include HTTParty
  base_uri 'http://www.car2go.com/api/v2.0'

  class << self
    def locations
      get('/locations', query: {format: 'json'})['location']
    end

    def vehicles(loc)
      get('/vehicles', query: {loc: loc, format: 'json'})['placemarks']
    end
  end
end
