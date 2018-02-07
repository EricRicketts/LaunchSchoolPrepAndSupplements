require 'minitest/autorun'
require 'minitest/pride'

class FirstExercise < Minitest::Test

  def setup
    @x = (1..5).to_a
  end

  def test_first_exercise
    result = @x.each do |a|
              a + 1
             end 
    assert_equal(@x, result)   
  end

end