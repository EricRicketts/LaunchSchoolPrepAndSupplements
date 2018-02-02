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

=begin
Third Exercise

Write a program that uses a hash to store a list of movie titles with the year they came out.
Then use the puts command to make your program print out the year of each movie to the screen.
The output for your program should look something like this.

1975
2004
2013
2001
1981

=end

  def test_third_exercise_create_hash_literal
    hsh = {
      "One Flew over the Cuckoo's Nest" => 1975,
      "Million Dollar Baby" => 2004,
      "12 Years a Slave" => 2013,
      "A Beautiful Mind" => 2001,
      "Chariots of Fire" => 1981
    }
    expected = [1975, 2004, 2013, 2001, 1981]
    keys = hsh.keys
    keys.each.with_index do |key, i|
      assert_equal(expected[i], hsh[key])
    end
  end

=begin
Fourth Exercise

Use the dates from the previous example and store them in an array.
Then make your program output the same thing as exercise 3.

=end

  def test_fourth_exercise_store_hash_values_in_array
    hsh = {
      "One Flew over the Cuckoo's Nest" => 1975,
      "Million Dollar Baby" => 2004,
      "12 Years a Slave" => 2013,
      "A Beautiful Mind" => 2001,
      "Chariots of Fire" => 1981
    }
    expected = [1975, 2004, 2013, 2001, 1981]
    assert_equal(expected, hsh.values)
  end

=begin
Fifth Exercise

Write a program that outputs the factorial of the numbers 5, 6, 7, and 8.

=end

  def test_fifth_exercise_factorials
    def factorial(n)
      (1..n).to_a.inject(&:*)
    end

    expected = [120, 720, 5040, 40320]
    (5..8).to_a.each.with_index do |num, i|
      assert_equal(expected[i], factorial(num))
    end
  end

=begin
Sixth Exercise

Write a program that calculates the squares of 3 float numbers
of your choosing and outputs the result to the screen.

=end

  def test_sixth_exercise_squares
    def square(n)
      n**2
    end

    expected = [2.25, 6.25, 12.25]
    ary = [1.5, 2.5, 3.5]
    ary.each.with_index do |num, i|
      assert_equal(expected[i], square(num))
    end
  end

=begin
Seventh Exercise

SyntaxError: (irb):2: syntax error, unexpected ')', expecting '}'
  from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

could have closed hash literal with a ')' instead of a '}'

essential error is that there was an opening bracket without the
corresponding closing bracket.

=end

end