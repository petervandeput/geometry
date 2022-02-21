require 'test_helper'
class CoordinateTest < Minitest::Test
  def setup

  end

  def test_coordinate_orientation
    assert Geometry::Coordinate.new(0,50).is_north?
    assert Geometry::Coordinate.new(0,-50).is_north? == false
    assert Geometry::Coordinate.new(0,-50).is_south?

    assert Geometry::Coordinate.new(50,50).is_east?
    assert Geometry::Coordinate.new(-50,-50).is_east? == false
    assert Geometry::Coordinate.new(-50,-50).is_west?


    assert Geometry::Coordinate.new(-50,-50,100).elevation == 100
    assert Geometry::Coordinate.new(-50,-50,).elevation == nil
  end

end

