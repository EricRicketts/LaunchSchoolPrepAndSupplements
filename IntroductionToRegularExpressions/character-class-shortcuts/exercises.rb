require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class Exercises < Minitest::Test

  def test_exercise_one
    str = "reds and blues" + "\n" + "the lazy cat sleeps"
    my_regex = /\s\w{3}\s/
    assert_equal(3, str.scan(my_regex).length)
  end

  def test_exercise_two
    str = "Doc in a big red box.\nHup! 2 3 4"
    my_regex1 = /\s...\s/
    first_result = str.scan(my_regex1)
    expected = [" big ", " 2 3 "]
    assert_equal(expected, first_result)
    # so why does this match work the way it does?
    # the first match is \sbig\s, but \sred\s
    # does not match because the opening \s for red
    # was the closing \s for big.  This is important
    # to note because the trailing \s for big was
    # consumed by the regex engine to make the match
    # for \sbig\s, thus the trailing \s is not
    # available for any other match sequence so red
    # does not get the benefit of a preceeding \s.
    # On the second line
    # \s2 3\s matches because the . can be any character
    # including a space.  It does not match box because
    # box is followed by a period.  It does not match
    # Hup! because Hup is followed by a !.  Doc is not
    # matched because it is not preceeded by whitespace
  end
  
end