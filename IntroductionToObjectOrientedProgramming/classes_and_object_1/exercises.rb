require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class MyCar
  
  attr_accessor :year, :color, :model, :speed

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(speed_increase)
    self.speed += speed_increase
  end

  def brake(speed_decrease)
    self.speed -= speed_decrease
  end

  def shut_off
    self.speed = 0
  end

end

class Exercises < Minitest::Test

  def setup
    @car = MyCar.new("1968", "Red", "Camaro")
    @car.speed_up(40)
  end

  def test_speed_up
    @car.speed_up(10)
    assert(50 == @car.speed, "car speeds up in the provided increments")
  end

  def test_brake
    @car.brake(20)
    assert(20 == @car.speed, "car brakes in the provided increments")
  end

  def test_shut_off
    @car.shut_off
    assert(0 == @car.speed, "car is stopped by shut_off method")
  end
  
end