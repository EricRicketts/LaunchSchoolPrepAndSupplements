require 'minitest/autorun'
require 'minitest/pride'

class FifthExercise < Minitest::Test

  def setup
    @str = "Welcome to America!"
  end
  
  def test_seventh_character
    assert("e" == @str[6])
  end

  def test_character_twelve
    assert("A" == @str[11])
  end

  def test_character_twenty
    assert_nil(@str[19])
  end

end