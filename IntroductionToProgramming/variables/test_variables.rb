require 'minitest/autorun'
require 'minitest/pride'

class TestVariables < Minitest::Test

  def test_outer_scope
    x = 0
    3.times { x += 1 }
    assert(x == 3, "outer scope accessible by inner scope")
  end

  def test_inner_scope_not_visible_to_outer_scope
    y = 0
    3.times do
      y += 1
      x = y
    end
    assert_raises(NameError, "variable defined in an inner scope do not exist in the outer scope") { puts x }
  end

end