require 'minitest/autorun'
require 'minitest/pride'

class ThirdExercise < Minitest::Test

  def test_select_element_from_array
    arr = [%w(test hello world), %w(example mem)]
    assert("example" == arr[1][0])
    assert("example" == arr.last.first)
  end
  
end