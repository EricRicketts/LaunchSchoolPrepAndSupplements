require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class MyCar

  attr_accessor :color
  attr_reader :year
  
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

  def spray_paint=(color)
    self.color = color
  end

end

class Exercises < Minitest::Test

  def setup
    @car = MyCar.new("1968", "Red", "Camaro")
    @car.speed_up(40)
  end

  def test_speed_up
    @car.speed_up(10)
    assert(50 == @car.current_speed, "car speeds up in the provided increments")
  end

  def test_brake
    @car.brake(20)
    assert(20 == @car.current_speed, "car brakes in the provided increments")
  end

  def test_shut_off
    @car.shut_off
    assert(0 == @car.current_speed, "car is stopped by shut_off method")
  end

  def test_view_color
    assert("Red" == @car.color)
  end

  def test_change_color
    @car.color = "Blue"
    assert("Blue" == @car.color)
  end

  def test_view_year
    assert("1968" == @car.year)
  end

  def test_spray_paint
    @car.spray_paint = "Black"
    assert("Black" == @car.color)
  end

end