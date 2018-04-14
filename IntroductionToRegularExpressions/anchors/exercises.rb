require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class Exercises < Minitest::Test
  
  def test_exercise_one
    str = "The lazy cat sleeps." + "\n" +
      "The number 623 is not a word." + "\n" +
      "Then, we went to the movies." + "\n" +
      "Ah. The bus has arrived."
    my_regex = /^The\b/
    assert_equal(2, str.scan(my_regex).length)    
  end

  def test_exercise_two
    str = "The lazy cat sleeps" + "\n" +
      "The number 623 is not a cat\n" +
      "The Alaskan drives a snowcat"
    my_regex = /\bcat$/
    assert_equal(1, str.scan(my_regex).length)    
  end

  def test_exercise_three
    str = "reds and blues\n" +
      "The lazy cat sleeps.\n" +
      "The number 623 is not a word. Or is it?"
    my_regex = /\b[a-z]{3}\b/i
    assert_equal(5, str.scan(my_regex).length)    
  end

  def test_exercise_four
    str = "A grey cat\n" + "The lazy dog\n" +
    "The white cat\n" + "A loud dog\n" +
    "Go away dog\n" + "The ugly rat\n" +
    "The lazy, loud dog"
  my_regex = /^(A|The)(\s\w{4}\s)(dog|cat)$/
  assert_equal(3, str.scan(my_regex).length)   
  end

end