require 'minitest/autorun'
require 'minitest/pride'

class FourthExercise < Minitest::Test

  def setup
    @arr = [15, 7, 18, 5, 12, 8, 5, 1]
  end

  def test_index_method
    assert(3 == @arr.index(5))
  end

  def test_wrong_call_index_method
    assert_raises(NoMethodError) { @arr.index[5] }
  end

  def test_standard_array_element_retrieval
    assert(8 == @arr[5])
  end

end