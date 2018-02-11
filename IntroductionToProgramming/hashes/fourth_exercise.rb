require 'minitest/autorun'
require 'minitest/pride'

class FourthExercise < Minitest::Test

  def test_hash_access
    person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
    assert('Bob' == person[:name])
  end
end