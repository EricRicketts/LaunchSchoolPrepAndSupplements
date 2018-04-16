require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class Exercises < Minitest::Test

  def test_exercise_one
    str = "To be or not to be\n" +
      "Be a busy bee\n" +
      "I brake for animals."
    my_regex = /\bb[a-z]*e\b/
    expected = %W(be be bee brake)
    assert_equal(expected, str.scan(my_regex))    
  end

  def test_exercise_two
    str = "What's up, doc?\n" +
      "Say what? No way.\n" + "?\n" +
      "Who? What? Where? When? How?"
    my_regex = /\?$/
    expected = %W(? ? ?)
    assert_equal(expected, str.scan(my_regex))
  end

  def test_exercise_three
    
  end
  
  def test_exercise_four
    
  end
  
  def test_exercise_five
    
  end
  
  def test_exercise_six
    
  end
  
  def test_exercise_seven
    
  end
  
  def test_exercise_eight
    
  end
  
  def test_exercise_nine
    
  end
  
  def test_exercise_ten
    
  end
  
  def test_exercise_eleven
    
  end
  
  def test_exercise_twelve
    
  end
  
end