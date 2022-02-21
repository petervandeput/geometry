# A Feature object represents a spatially bounded thing.  Every Feature
#    object is a GeoJSON object no matter where it occurs in a GeoJSON
#    text.
#
#    o  A Feature object has a "type" member with the value "Feature".
#
#    o  A Feature object has a member with the name "geometry".  The value
#       of the geometry member SHALL be either a Geometry object as
#       defined above or, in the case that the Feature is unlocated, a
#       JSON null value.
#
#    o  A Feature object has a member with the name "properties".  The
#       value of the properties member is an object (any JSON object or a
#       JSON null value).

module Geometry
  class Feature
    def initialize
    end
  end
end