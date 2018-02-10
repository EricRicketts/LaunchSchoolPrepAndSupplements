require 'minitest/autorun'
require 'minitest/pride'

class SixthExercise < Minitest::Test

  def setup
    @names = %w(bob joe susan margaret)
  end

  def test_incorrect_assignment
    # attempts to access array via a string index, but indices in
    # arrays are integers not strings
    assert_raises(TypeError) { @names['margaret'] = 'jody' }
  end

  def test_correct_assignment
    @names[3] = 'jody'   
    assert('jody' == @names.last)
  end

end