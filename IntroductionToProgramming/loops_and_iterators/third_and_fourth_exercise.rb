require 'minitest/autorun'
require 'minitest/pride'

class ThirdAndFourthExercise < Minitest::Test

  def countdown(n)
    @ary.push(n)
    countdown(n-1) if n > 0   
  end

  def setup
    @x = (-5..5).to_a
    @ary = []
  end

  def test_each_with_index
    result = []
    expected = [
      [0, -5], [1, -4], [2, -3], [3, -2],
      [4, -1], [5, 0], [6, 1], [7, 2], [8, 3],
      [9, 4], [10, 5]
    ]
    @x.each.with_index { |num, i| result.push([i, num]) }
    map_result = @x.map.with_index { |num, i| [i, num] }
    assert_equal(expected, result)
    assert_equal(expected, map_result)
  end

  def test_countdown
    expected = (-20..0).to_a.map {|n| -1*n }
    countdown(20)
    assert_equal(expected, @ary)
  end
end