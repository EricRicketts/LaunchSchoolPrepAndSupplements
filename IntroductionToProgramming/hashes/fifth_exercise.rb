require 'minitest/autorun'
require 'minitest/pride'

class FifthExercise < Minitest::Test

  def test_has_value
    hsh = {one: 1, two: 2, three: 3, four: 4}
    assert(hsh.has_value?(3) && !hsh.has_value?(10))
  end
  
end