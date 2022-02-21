#   Each element in the "geometries" array of a GeometryCollection is one
#    of the Geometry objects described above:
#
#      {
#          "type": "GeometryCollection",
#          "geometries": [{
#              "type": "Point",
#              "coordinates": [100.0, 0.0]
#          }, {
#              "type": "LineString",
#              "coordinates": [
#                  [101.0, 0.0],
#                  [102.0, 1.0]
#              ]
#          }]
#      }

module Geometry
  class GeometryCollection
    def initialize
    end
  end
end