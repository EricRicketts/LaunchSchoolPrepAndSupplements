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

=begin
Second Exercise

Use the modulo operator, division, or a combination of both to take a 4 digit number
and find the digit in the: 1) thousands place 2) hundreds place 3) tens place 4) ones place

Here is the algorithm

2.5.0 :050 > 4321 / 1000 => 4 % 1
 => 4 
2.5.0 :051 > 4321 / 100 % 4 => (4321/100) % (4321/1000) => 43 % 4
 => 3 
2.5.0 :052 > 4321 / 10 % 43 => (4321/10) % (4321/100) => 432 % 43
 => 2 
2.5.0 :053 > 4321 / 1 % 432 => (4321/1) % (4321/10) => 4321 % 432
 => 1 

=end


  def test_second_exercise_pick_of_digits
    expected = [4, 3, 2, 1]
    ary = Array.new(4, 4321)
    power = ary.length - 1
    number_ary = ary.each.with_index.map do |num, i|
      if i == 0
        num / 10**(power - i)
      else
        (num / 10**(power - i)) % (num / 10**(power - i + 1))    
      end
    end
    assert_equal(expected, number_ary)
  end

end