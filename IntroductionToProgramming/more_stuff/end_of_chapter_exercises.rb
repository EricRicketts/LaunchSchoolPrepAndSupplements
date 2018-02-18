require 'minitest/autorun'
require 'minitest/pride'

class FirstExercise < Minitest::Test

  def execute_error(&block)
    block
  end

  def execute_correctly(&block)
    block.call
  end

  def setup
    @ary = %W(laboratory experiment Pans\sLabyrinth elaborate polar\sbear)
    @expected = %W(laboratory elaborate)
  end

  def test_first_exercise
    result = @ary.select {|string| string =~ /lab/}
    assert_equal(@expected, result)
  end

  def test_no_block_call
    # returns a Proc object, the Proc is not called in the method body
    assert_instance_of(Proc, execute_error {"Hello from inside the execute method!"})    
  end

=begin
the third exercise dealt with exception handling and asked what problem does exception
handling solve.  Exception handling is a specific process that deals with errors in a
manageable and predictable way.
=end

  def test_block_call
    string = "Hello from inside the execute method!"
    assert_equal(string, execute_correctly {string})
  end

=begin
def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

block.rb1:in `execute': wrong number of arguments (0 for 1) (ArgumentError)
from test.rb:5:in `<main>'

this happens because block is passed in as a normal parameter it is not prefixed
with the '&' so the method is expecting a normal argument upon invocation, not
a block.  Thus Ruby says, I am looking for 1 argument to the method but you did
not give me any arguments, only a block which I am ignoring.
=end  

end