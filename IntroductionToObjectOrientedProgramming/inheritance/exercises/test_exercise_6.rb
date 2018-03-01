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

  attr_accessor :color
  attr_reader :zero_to_sixty, :year, :model

  def self.number_of_vehicles
    @@number_of_vehicles
  end

  def self.clear_vehicle_count
    @@number_of_vehicles = 0
  end

  def initialize(year, model, color)
    @@number_of_vehicles += 1
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def accelerate(number)
    @current_speed += number  
  end

  def brake(number)
    @current_speed -= number
  end

  def current_speed
    @current_speed
  end

  def stop
    @current_speed = 0
  end

  def stopped?
    @current_speed == 0
  end

  def how_old?
    "Vehicle is #{age} years old."
  end

  private

  def age
    Time.new.year - self.year.to_i
  end

end

class MyCar < Vehicle
  include SpeedEnhancing
  NUMBER_OF_DOORS = 4

  def initialize(year, model, color)
    super
    @zero_to_sixty = 5.0
  end
  
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  attr_reader :payload

  def initialize(year, model, color)
    super
    @zero_to_sixty = 7.0
    @payload = 2000
  end

end

class TestExercise1 < Minitest::Test

  def setup
    @car = MyCar.new("1968", "Camaro", "Red")
    @truck = MyTruck.new("2016", "F-150", "Black")
  end

  def teardown
    Vehicle.clear_vehicle_count    
  end

  def test_common_attributes
    assert(@car.stopped? && @truck.stopped?)
  end

  def test_car_constant
    assert_equal(4, MyCar::NUMBER_OF_DOORS)
  end

  def test_truck_constant
    assert_equal(2, MyTruck::NUMBER_OF_DOORS)
  end

  def test_car_accelerate
    assert_equal(5.0, @car.zero_to_sixty)
  end
  
  def test_truck_accelerate
    assert_equal(7.0, @truck.zero_to_sixty)
  end

  def test_number_of_vehicles
    assert(Vehicle.number_of_vehicles == 2)
  end

  def test_faster_car
    assert_equal(200, @car.new_top_end)
  end

  def test_inherit_chain
    car_ancestors = MyCar.ancestors
    car_ancestors.delete(Minitest::Expectations)
    truck_ancestors = MyTruck.ancestors
    truck_ancestors.delete(Minitest::Expectations)
    car_expected = [MyCar, SpeedEnhancing, Vehicle, Object, Kernel, BasicObject]
    truck_expected = [MyTruck, Vehicle, Object, Kernel, BasicObject]
    assert(car_expected == car_ancestors && truck_expected == truck_ancestors)
  end

  def test_speed_up
    @car.accelerate(30)
    assert_equal([30, false], [@car.current_speed, @car.stopped?])
  end
  
  def test_brake
    @truck.accelerate(30)
    @truck.brake(10)
    assert_equal(20, @truck.current_speed)
  end

  def test_age_of_vehicles
    truck_expected = "Vehicle is 2 years old."
    car_expected = "Vehicle is 50 years old."
    assert(truck_expected == @truck.how_old? && car_expected == @car.how_old?)
  end
  
end