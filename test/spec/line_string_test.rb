require 'test_helper'

class LineStringTest < Minitest::Test
  def setup

  end

  def test_return_for_linestring
    line_string = Geometry::LineString.new()
    line_string.add_coordinate(Geometry::Coordinate.new(0, 51))
    assert line_string.coordinates.count == 1
    line_string.add_position_by_longitude_and_latitude(-10, 30)
    assert line_string.coordinates.count == 2
    expected_result = "{\"type\":\"LineString\",\"coordinates\":[[0,51],[-10,30]]}"
    assert line_string.to_object == expected_result

    line_string.add_position_by_longitude_and_latitude(-10, 34, 2900)
    assert line_string.coordinates.count == 3

    expected_result_with_elevation = "{\"type\":\"LineString\",\"coordinates\":[[0,51],[-10,30],[-10,34,2900]]}"
    assert line_string.to_object == expected_result_with_elevation

  end

end

