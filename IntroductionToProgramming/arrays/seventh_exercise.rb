require 'minitest/autorun'
require 'minitest/pride'

class SeventhExercise < Minitest::Test

  def test_muliply_by_two
    arr = (1..10).to_a
    expected = (3..12).to_a
    result = arr.map { |num| num + 2 }
    assert_equal(expected, result)
  end
  
end