require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class Student

  attr_accessor :name
  attr_writer :grade

  def initialize(name)
    @name = name
    @grade = 0
  end

  def better_grade_than?(student)
    self.grade > student.grade            
  end

  protected

  def grade
    @grade
  end

end

class TestExercises7And8 < Minitest::Test

  def setup
    @joe = Student.new("Joe")
    @bob = Student.new("Bob")
  end

  def test_grade_compare
    @joe.grade = 90
    @bob.grade = 85
    assert(@joe.better_grade_than?(@bob))
  end

end

=begin
bob = Person.new
bob.hi
And the corresponding error message...

NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
from (irb):8
from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb: `<main>`

the problem #hi is a private method, in order to fix the problem
we just make the private method a public method or have a newly
defined public method call the existing private method
=end