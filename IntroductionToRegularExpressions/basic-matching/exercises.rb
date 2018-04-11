require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class Exercises < Minitest::Test

  def test_exercise_one
    str = "Kx\nBlacK\nkelly"
    assert_equal(2, str.scan(/K/).length)
  end

  def test_exercise_two
    str = "Henry\nperch\ngold"
    assert_equal(2, str.scan(/h/i).length)
  end
  
end