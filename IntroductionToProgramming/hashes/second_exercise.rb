require 'minitest/autorun'
require 'minitest/pride'

class SecondExercise < Minitest::Test

  def setup
    @h1 = {one: "one", two: "two"}
    @h2 = {three: "three", four: "four"}
    @expected = {one: "one", two: "two", three: "three", four: "four"}
  end

  def test_non_destructive_merge
    assert_equal(@expected, @h1.merge(@h2))    
  end

  def test_destructive_merge
    @h1.merge!(@h2)
    assert_equal(@expected, @h1)
  end

end