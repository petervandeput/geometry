#
#  Coordinates of a Polygon are an array of linear ring (see
#    Section 3.1.6) coordinate arrays.  The first element in the array
#    represents the exterior ring.  Any subsequent elements represent
#    interior rings (or holes).
#
#    No holes:
#
#      {
#          "type": "Polygon",
#          "coordinates": [
#              [
#                  [100.0, 0.0],
#                  [101.0, 0.0],
#                  [101.0, 1.0],
#                  [100.0, 1.0],
#                  [100.0, 0.0]
#              ]
#          ]
#      }
#
#    With holes:
#
#      {
#          "type": "Polygon",
#          "coordinates": [
#              [
#                  [100.0, 0.0],
#                  [101.0, 0.0],
#                  [101.0, 1.0],
#                  [100.0, 1.0],
#                  [100.0, 0.0]
#              ],
#              [
#                  [100.8, 0.8],
#                  [100.8, 0.2],
#                  [100.2, 0.2],
#                  [100.2, 0.8],
#                  [100.8, 0.8]
#              ]
#          ]
#      }
module Geometry
  class Polygon
    attr_accessor :coordinates
    attr_accessor :exterior_ring
    attr_accessor :interior_rings

    def initialize
      @coordinates = []
      @exterior_ring = []
      @interior_rings = []
    end

    def add_exterior_ring(array_of_coordinates)
      raise StandardError.new "Exterior ring needs to be an array" if array_of_coordinates.class != Array
      raise StandardError.new "First and last coordinate in the array need to be identical" if  validate_first_and_last_point_are_the_same(array_of_coordinates) == false
      if @exterior_ring.count == 0
        @exterior_ring = array_of_coordinates
      else
        raise StandardError.new "Only one exterior ring is allowed"
      end
    end

    def has_exterior_ring?
      return @exterior_ring.count > 0
    end

    def add_interior_ring(array_of_coordinates)
      raise StandardError.new "Interior ring needs to be an array" if array_of_coordinates.class != Array
      raise StandardError.new "First and last coordinate in the array need to be identical" if  validate_first_and_last_point_are_the_same(array_of_coordinates) == false
      @interior_rings << array_of_coordinates
    end

    def has_interior_ring?
      return @interior_rings.count > 0
    end

    def interior_rings
      return @interior_rings.count
    end

    def to_object
      result = []
      exterior_ring_coordinates_array = []
      @exterior_ring.each do |coordinate|
        exterior_ring_coordinates_array << coordinate.as_array
      end
      result << exterior_ring_coordinates_array
      @interior_rings.count.times do |counter|
        ring = []
        @interior_rings[counter].each do |coordinate|
          ring << coordinate.as_array
        end
        result << ring
      end
      return {"type" => "Polygon", "coordinates" => result}.to_json
    end


    private
    def validate_first_and_last_point_are_the_same(array_of_coordinates)
      return array_of_coordinates.first.longitude == array_of_coordinates.last.longitude && array_of_coordinates.first.latitude == array_of_coordinates.last.latitude
    end

  end

end