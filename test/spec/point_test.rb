require 'test_helper'
class PointTest < Minitest::Test
  def setup

  end

  def test_point_functionality
    point = Geometry::Point.new(30.0,10.0)
    expected_result = "{\"type\":\"Point\",\"coordinates\":[30.0,10.0]}"
    assert point.to_object == expected_result
    assert point.coordinate.latitude == 10.0
    assert point.coordinate.longitude == 30.0
  end

end

