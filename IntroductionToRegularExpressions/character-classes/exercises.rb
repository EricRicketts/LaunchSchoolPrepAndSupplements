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

  def test_exercise_seven
    str = "aBc"
    my_regex1 = Regexp.new(/(ABC|abc)/)
    my_regex2 = Regexp.new(/[Aa][Bb][Cc]/)
    refute(str.match(my_regex1))
    assert(str.match(my_regex2))
  end

  def test_exercise_eight
    # patterns are equivalent as specified
    my_regex1 = Regexp.new(/abc/i)
    my_regex2 = Regexp.new(/[aA][bB][cC]/)
    str = "AbC"
    assert(str.match(my_regex1))  
    assert(str.match(my_regex2))  
  end

  def test_exercise_nine
    str = "The regex /[^a-z]/i matches any character that is" + "\n" +
      "not a letter. Similarly, /[^0-9]/ matches any" + "\n" +
      "non-digit while /[^A-Z]/ matches any character" + "\n" +
      "that is not an uppercase letter. Beware: /[^+-<]/" + "\n" +
      "is at best obscure, and may even be wrong."
    expected = ["[^a-z]", "[^0-9]", "[^A-Z]"]
    my_regex = Regexp.new(/\[\^[aA0]\-[zZ9]\]/)
    assert_equal(expected, str.scan(my_regex))
    # better solution from book /\[\^[0-9a-zA-Z]-[0-9a-zA-Z]\]/
  end
  
end