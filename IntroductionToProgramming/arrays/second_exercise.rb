require 'minitest/autorun'
require 'minitest/pride'

class SecondExercise < Minitest::Test

  def setup
    @arr = ["b", "a"]
  end

  def test_first_product
    expected = [["b", 1], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]
    arr = @arr.product(Array(1..3))
    assert_equal(expected, arr)
  end
  
  def test_first_product_modification
    arr = @arr
    arr = arr.product(Array(1..3))
    arr.first.delete(arr.first.last)
    expected = [["b"], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]
    assert_equal(expected, arr)
  end
  
  def test_second_product
    expected = [["b", [1, 2, 3]], ["a", [1, 2, 3]]]
    arr = @arr.product([Array(1..3)])
    assert_equal(expected, arr)
  end
  
  def test_second_product_modification
    arr = @arr
    arr = arr.product([Array(1..3)])
    arr.first.delete(arr.first.last)
    expected = [["b"], ["a", [1, 2, 3]]]
    assert_equal(expected, arr)
  end
  
end