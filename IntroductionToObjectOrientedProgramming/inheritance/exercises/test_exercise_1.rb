require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class Vehicle

  attr_reader :zero_to_sixty

  def initialize
    @movement = false
  end

  def stopped?
    @movement
  end

end

class MyCar < Vehicle
  MAKE_OF_CAR = "Challenger"

  def initialize
    super
    @zero_to_sixty = 5.0
  end
  
end

class MyTruck < Vehicle
  MAKE_OF_TRUCK = "F-150"

  attr_reader :payload

  def initialize
    super
    @zero_to_sixty = 7.0
    @payload = 2000
  end

end

class TestExercise1 < Minitest::Test

  def setup
    @car = MyCar.new
    @truck = MyTruck.new
  end

  def test_common_attributes
    assert(@car.stopped? == false && @truck.stopped? == false)
  end

  def test_car_constant
    assert_equal("Challenger", MyCar::MAKE_OF_CAR)
  end

  def test_truck_constant
    assert_equal("F-150", MyTruck::MAKE_OF_TRUCK)
  end

  def test_car_accelerate
    assert_equal(5.0, @car.zero_to_sixty)
  end
  
  def test_truck_accelerate
    assert_equal(7.0, @truck.zero_to_sixty)
  end
  
end