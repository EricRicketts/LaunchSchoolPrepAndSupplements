require 'minitest/autorun'
require 'minitest/pride'

class BookRecursion < Minitest::Test

  def doubler(start)
    @ary.push(start)
    if start < 20
      doubler(start * 2)
    end    
  end

  def fibonacci(n)
    # book had better solution => return number if number < 2
    return 0 if n == 0
    return 1 if n == 1
    return fibonacci(n-1) + fibonacci(n-2)
  end

  def setup
    @ary = []
  end
 
  def test_doubler
    expected = [2, 4, 8, 16, 32]
    doubler(2)
    assert_equal(expected, @ary)     
  end

  def test_fibonacci
    expected = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
    results = [
      fibonacci(0), fibonacci(1), fibonacci(2), fibonacci(3),
      fibonacci(4), fibonacci(5), fibonacci(6), fibonacci(7),
      fibonacci(8), fibonacci(9), fibonacci(10)
    ]
    assert_equal(expected, results)
  end

end