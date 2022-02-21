#Coordinates of LineString are an array of positions (see
#    Section 3.1.1):
#
#      {
#          "type": "LineString",
#          "coordinates": [
#              [100.0, 0.0],
#              [101.0, 1.0]
#          ]
#      }
module Geometry
  class LineString
    attr_accessor :coordinates

    def initialize
      @coordinates = []
    end

    def add_coordinate(coordinate)
      @coordinates << coordinate
    end

    def add_position_by_longitude_and_latitude(longitude, latitude,elevation=nil)
      @coordinates << Geometry::Coordinate.new(longitude, latitude,elevation)
    end



    def to_object
      coordinates_array = []
      @coordinates.each do |coordinate|
        coordinates_array << coordinate.as_array
      end
      return {"type" => "LineString", "coordinates" => coordinates_array}.to_json
    end


  end
end