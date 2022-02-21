require 'test_helper'
class PolygonTest < Minitest::Test
  def setup

  end

  def test_polygon_functions
    exterior_ring = []
    exterior_ring << Geometry::Coordinate.new(35,10)
    exterior_ring << Geometry::Coordinate.new(45,45)
    exterior_ring << Geometry::Coordinate.new(15,40)
    exterior_ring << Geometry::Coordinate.new(10,20)
    exterior_ring << Geometry::Coordinate.new(35,10)
    polygon = Geometry::Polygon.new

    assert polygon.has_exterior_ring? == false

    polygon.add_exterior_ring(exterior_ring)
    assert polygon.has_exterior_ring? == true
    assert_raises(StandardError,"Only one exterior ring is allowed") do
      polygon.add_exterior_ring(exterior_ring)
    end
    assert_raises(StandardError,"Exterior ring needs to be an array") do
      polygon.add_exterior_ring("ABC")
    end

    interior_ring = []
    interior_ring << Geometry::Coordinate.new(20,30)
    interior_ring << Geometry::Coordinate.new(35,35)
    interior_ring << Geometry::Coordinate.new(30,20)
    interior_ring << Geometry::Coordinate.new(20,30)

    assert polygon.has_interior_ring? == false
    polygon.add_interior_ring(interior_ring)
    assert polygon.has_interior_ring? == true
    assert_raises(StandardError,"Exterior ring needs to be an array") do
      polygon.add_interior_ring("ABC")
    end
    assert polygon.interior_rings == 1
    polygon.add_interior_ring(interior_ring)
    assert polygon.interior_rings == 2
    expected_result = "{\"type\":\"Polygon\",\"coordinates\":[[[35,10],[45,45],[15,40],[10,20],[35,10]],[[20,30],[35,35],[30,20],[20,30]],[[20,30],[35,35],[30,20],[20,30]]]}"
    assert polygon.to_object == expected_result

    #adding a last coordinate so the ring is not having the same start and ending coordinate
    interior_ring << Geometry::Coordinate.new(50,50)
    assert_raises(StandardError,"First and last coordinate in the array need to be identical") do
      polygon.add_interior_ring(interior_ring)
    end
  end



end

