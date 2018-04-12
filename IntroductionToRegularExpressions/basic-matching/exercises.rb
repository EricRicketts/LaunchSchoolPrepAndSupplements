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
  
  def test_exercise_two_option_two
    # the alternation method gives greater
    # specificity, the /<regex/i suffix
    # makes case insensitive the entire regex
    str = "Henry\nperch\ngold"
    assert_equal(2, str.scan(/(h|H)/).length)
  end

  def test_exercise_three
    str = "snapdragon\nbearded dragon\ndragoon"
    assert_equal(2, str.scan(/dragon/).length)
  end
  
  def test_exercise_four
    str = "banana\norange\npineapples\nstrawberry\nraspberry\ngrappler"
    assert_equal(5, str.scan(/(banana|orange|apple|strawberry)/).length)
  end
  
  def test_exercise_five
    str = "This line has spaces\nThis,line,has,commas,\nNo-spaces-or-commas"
    assert_equal(7, str.scan(/([ ]|,)/).length)
  end

  def test_exercise_six
    str = %W(blueberry blackberry black\sberry strawberry)
    expected = %W(blueberry blackberry)
    result = str.map {|str| str.match(/bl(ue|ack)berry/)}.compact.map {|regex_obj| regex_obj[0]}
    assert_equal(expected, result)
  end
  
end