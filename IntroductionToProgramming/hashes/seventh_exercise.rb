require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class SeventhExercise < Minitest::Test

  def test_differences_in_keys
    x = "hi there"
    my_hash = {x: "some value"}
    my_hash2 = {x => "some value"}
    # my_hash key is the symobl :x while my_hash2 key is the
    # string "hi there"
    refute(my_hash.keys.at(0) == my_hash2.keys.at(0))
  end

end