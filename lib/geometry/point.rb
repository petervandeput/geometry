# Point coordinates are in x, y order (easting, northing for projected
# coordinates, longitude, and latitude for geographic coordinates):
#
#       {
#           "type": "Point",
#           "coordinates": [100.0, 0.0]
#       }

module Geometry
  class Point
    attr_accessor :coordinate

    def initialize(longitude, latitude,elevation=nil)
      @coordinate = Geometry::Coordinate.new(longitude, latitude,elevation)
    end

    def to_object
      return {"type" => "Point", "coordinates" => @coordinate.as_array}.to_json
    end

  end
end