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
  
end