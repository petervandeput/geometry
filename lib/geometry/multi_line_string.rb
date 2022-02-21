#
# Coordinates of a MultiLineString are an array of LineString
#    coordinate arrays:
#
#      {
#          "type": "MultiLineString",
#          "coordinates": [
#              [
#                  [100.0, 0.0],
#                  [101.0, 1.0]
#              ],
#              [
#                  [102.0, 2.0],
#                  [103.0, 3.0]
#              ]
#          ]
#      }
module Geometry
  class MultiLineString
    attr_accessor :lines

    def initialize
      @lines = []
    end
    def add_line(array_of_coordinates)
      raise StandardError.new "Line needs to be an array" if array_of_coordinates.class != Array
      @lines << array_of_coordinates
    end

    def to_object
      result = []
      exterior_ring_coordinates_array = []
      @lines.each do |line|
        line_array = []
        line.each do |coordinate|
          line_array << coordinate.as_array
        end
        result << line_array
      end
      return {"type" => "MultiLineString", "coordinates" => result}.to_json
    end
  end
end