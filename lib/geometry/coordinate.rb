module Geometry
  class Coordinate
    attr_accessor :longitude, :latitude, :elevation
    def initialize(longitude,latitude,elevation=nil)
      @longitude = longitude
      @latitude = latitude
      @elevation = elevation
    end

    def as_array
      return [@longitude,@latitude] if @elevation.nil?
      return [@longitude,@latitude,@elevation] if !@elevation.nil?
    end

    def is_north?
      return @latitude > 0
    end
    def is_south?
      return @latitude < 0
    end
    def is_east?
      return @longitude > 0
    end
    def is_west?
      return @longitude < 0
    end

  end
end