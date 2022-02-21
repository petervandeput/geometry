require 'test_helper'
class MultiLineStringTest < Minitest::Test
  def setup

  end

  def test_multi_line_functionality
    line_1 = []
    line_1 << Geometry::Coordinate.new(10.0,10.0)
    line_1 << Geometry::Coordinate.new(20.0,20.0)
    line_1 << Geometry::Coordinate.new(10.0,40.0)


    multi_line_string = Geometry::MultiLineString.new
    assert_raises(StandardError,"Line needs to be an array") do
      multi_line_string.add_line("ABC")
    end
    assert multi_line_string.lines.count == 0
    multi_line_string.add_line(line_1)
    assert multi_line_string.lines.count == 1
    line_2 = []
    line_2 << Geometry::Coordinate.new(40.0,40.0)
    line_2 << Geometry::Coordinate.new(30.0,30.0)
    line_2 << Geometry::Coordinate.new(40.0,20.0)
    line_2 << Geometry::Coordinate.new(30.0,10.0)
    multi_line_string.add_line(line_2)
    assert multi_line_string.lines.count == 2
    expected_result = "{\"type\":\"MultiLineString\",\"coordinates\":[[[10.0,10.0],[20.0,20.0],[10.0,40.0]],[[40.0,40.0],[30.0,30.0],[40.0,20.0],[30.0,10.0]]]}"

    assert multi_line_string.to_object == expected_result
  end

end

