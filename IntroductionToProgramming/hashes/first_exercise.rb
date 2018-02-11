require 'minitest/autorun'
require 'minitest/pride'

class FirstExercise < Minitest::Test

  def test_select_method
    family = {
      uncles: %w(bob joe steve),
      sisters: %w(jane jill beth),
      brothers: %w(frank rob david),
      aunts: %w(mary sally susan)
    }
    expected = %w(jane jill beth frank rob david)
    result = family.select {|k,v| k == :sisters || k == :brothers}.values.flatten
    assert_equal(expected, result)
  end
  
end