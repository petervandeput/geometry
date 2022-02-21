require 'test_helper'
class MultiPointTest < Minitest::Test
  def setup

  end

  def test_point_functionality
    multi_point = Geometry::MultiPoint.new
    multi_point.add_coordinate(Geometry::Coordinate.new(0, 51))
    assert multi_point.coordinates.count == 1
    multi_point.add_position_by_longitude_and_latitude(-10, 30)
    assert multi_point.coordinates.count == 2
    expected_result = "{\"type\":\"MultiPoint\",\"coordinates\":[[0,51],[-10,30]]}"
    assert multi_point.to_object == expected_result

    multi_point.add_position_by_longitude_and_latitude(-10, 34, 2900)
    assert multi_point.coordinates.count == 3

    expected_result_with_elevation = "{\"type\":\"MultiPoint\",\"coordinates\":[[0,51],[-10,30],[-10,34,2900]]}"
    assert multi_point.to_object == expected_result_with_elevation

  end

end

