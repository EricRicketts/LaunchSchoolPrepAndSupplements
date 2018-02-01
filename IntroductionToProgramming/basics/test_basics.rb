require 'minitest/autorun'
require 'minitest/pride'

class TestBasics < Minitest::Test

=begin
First Exercise

Add two strings together that, when concatenated, return your first and last name as your full name in one string.

"<Firstname> <Lastname>"
For example, if your name is John Doe, think about how you can put "John" and "Doe" together to get "John Doe".

=end 

  def test_first_exercise_first_solution
    first_name = "John"
    last_name = "Doe"
    assert_equal("John Doe", "#{first_name} #{last_name}", "use all variable interpolation to concatenate")
  end

  def test_first_exercise_second_solution
    first_name = "John"
    last_name = "Doe"
    assert_equal("John Doe", "#{first_name}" + " " + "#{last_name}", "use spaces to concatenate")
  end

  def test_first_exercise_third_solution
    first_name = "John"
    last_name = "Doe"
    assert_equal("John Doe", "#{first_name}" " " "#{last_name}", "use spaces to concatenate")
  end

end