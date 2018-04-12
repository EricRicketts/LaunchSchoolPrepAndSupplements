require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class Exercises < Minitest::Test

  def test_exercise_one
    str = %W(Kitchen\sKaboodle Reds\sand\sblues kitchen\sServers)
    assert(str.all? {|str| str.match?(/[kKs]/)})
  end

  def test_exercise_two
    str = "My cats, Butterscotch and Pudding, like to" + "\n" +
      "sleep on my cot with me, but they cut my sleep" + "\n" +
      "short with acrobatics when breakfast time rolls" + "\n" +
      "around. I need a robotic cat feeder."
    my_regex = Regexp.new(/[bcBC][aouAOU][tT]/)
    # better solution is /[bc][aou]t/i since the entire regex can
    # be case insensitive
    assert_equal(9, str.scan(my_regex).length)
  end

  def test_exercise_three
    str = "0xDEADBEEF" + "\n" +
      "1234.5678" + "\n" +
      "Jamaica" + "\n" +
      "plow ahead"
    my_regex = Regexp.new(/[0-9A-Ja-j]/)
    assert_equal(28, str.scan(my_regex).length)
  end

  def test_exercise_four_and_five
    str = "0x1234" + "\n" +
      "Too many XXXXXXXXXXxxxxxxXXXXXXXXXXXX to count." + "\n" +
      "The quick brown fox jumps over the lazy dog" + "\n" +
      "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG"
    my_regex = Regexp.new(/[a-wyzA-WYZ]/)
    assert_equal(82, str.scan(my_regex).length)
    # [^xX] will not work because characters other than
    # letters will be matched, the exercise only class
    # for all letters to be matched that are not x or X
  end

  def test_exercise_six
    str = "0x1234abcd" + "\n" +
      "1,000,000,000s and 1,000,000,000s." + "\n" +
      "THE quick BROWN fox JUMPS over THE lazy DOG!"
    my_regex = Regexp.new(/[^A-Za-z]/)
    assert([45, 46].include?(str.scan(my_regex).length))
    # a better regex would be /[^a-z]/i
  end
  
end