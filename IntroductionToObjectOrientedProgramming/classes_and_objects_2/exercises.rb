require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class MyCar

  attr_accessor :color
  attr_reader :year, :model

  def self.mileage(miles, gallons)
    "Miles per gallon are: #{miles*1.0/gallons}."
  end
  
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(speed_increase)
    @speed += speed_increase
  end

  def brake(speed_decrease)
    @speed -= speed_decrease
  end

  def shut_off
    @speed = 0
  end

  def current_speed
    @speed
  end

  def spray_paint(color)
    self.color = color
    "With the spray paint the new color of your car is #{self.color}"
  end

  def to_s
    "My car is a #{year} #{color} #{model}"   
  end

end

class Exercises < Minitest::Test

  def setup
    @car = MyCar.new("1968", "Red", "Camaro")
  end

  def test_miles_per_gallon
    assert_equal("Miles per gallon are: 50.0.", MyCar.mileage(200, 4))
  end

  def test_override_to_s
    # note puts @car would give the same output
    expected = "My car is a 1968 Red Camaro"
    assert_equal(expected, @car.to_s)    
  end

end

=begin

class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

there is a "no method" error because attr_reader only generates
a getter method on the @name instance variable.  In order to make
the above code work, one needs to change the attr_reader to
attr_accessor.  If we do not need the getter functionality
we can use attr_writer
=end