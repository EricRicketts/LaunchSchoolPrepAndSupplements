require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class Board
end

module Speak
  def speak(sound)
    sound
  end
end

class Animal
  include Speak  
end

class Exercises < Minitest::Test

  def setup
    @board = Board.new
    @animal = Animal.new
  end

  def test_basic_class
    assert_instance_of(Board, @board)   
  end

  def test_animal_speak
    assert("Meow" == @animal.speak("Meow"))
  end

  def test_ancestors
    expected = [Animal, Speak, Object, Minitest::Expectations, Kernel, BasicObject]
    assert_equal(expected, Animal.ancestors)
  end

=begin
In the last test what we were demonstrating is the lookup path Ruby takes when
calling a method.  It first looks at the current Class definition, and then travels
to any Module definition where the Module has been mixed into the class.  It then
goes to Object, then Kernel, and finally BasicObject.  We can skip Minitest::Expectations
because that is just a function of our current test environment
=end

end