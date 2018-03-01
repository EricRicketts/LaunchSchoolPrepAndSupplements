require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

module SpeedEnhancing
  def new_top_end
    200
  end
end

class Vehicle
  @@number_of_vehicles = 0

  attr_reader :zero_to_sixty

  def self.number_of_vehicles
    @@number_of_vehicles
  end

  def self.clear_vehicle_count
    @@number_of_vehicles = 0
  end

  def initialize
    @movement = false
    @@number_of_vehicles += 1
  end

  def stopped?
    @movement
  end

end

class MyCar < Vehicle
  include SpeedEnhancing
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

  def teardown
    Vehicle.clear_vehicle_count    
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

  def test_number_of_vehicles
    another_car = MyCar.new
    another_truck = MyTruck.new
    assert(Vehicle.number_of_vehicles == 4)
  end

  def test_faster_car
    assert_equal(200, @car.new_top_end)
  end
  
end