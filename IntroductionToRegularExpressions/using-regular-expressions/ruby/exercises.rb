require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class Exercises < Minitest::Test

  def url?(str)
    str.match?(/\Ahttps?:\/\/\S+\z/)
  end

  def fields(str)
    str.split(/\W+/)
  end

  def mystery_math(str)
    str.sub(/[+\-*\/]/, "?")
  end

  def mysterious_math(str)
    str.gsub(/[+*\-\/]/, "?")
  end

  def danish(str)
    str.sub(/\b(apple|blueberry|cherry)\b/, 'danish')
  end

  def test_url
    urls = ['http://launchschool.com', 'https://example.com',
      'https://example.com hello', '   https://example.com']
    expected = [true, true, false, false]
    assert_equal(expected, urls.map {|str| url?(str)})
  end

  def test_fields
    strs = ["Pete,201,Student", "Pete \t 201    ,  TA",
      "Pete \t 201"]
    expected = [
      ["Pete", "201", "Student"],
      ["Pete", "201", "TA"],
      ["Pete", "201"]
    ]
    assert_equal(expected, strs.map {|str| fields(str)})
  end

  def test_mystery_math
    expressions = [
      '4 + 3 - 5 = 2',
      '4 - 3 - 5 = -4',
      '4 * 3 - 5 = 7',
      '4 / 2 - 5 = -3',
      '(4 * 3 + 2) / 7 - 1 = 1'
    ]
    expected = [
      '4 ? 3 - 5 = 2',
      '4 ? 3 - 5 = -4',
      '4 ? 3 - 5 = 7',
      '4 ? 2 - 5 = -3',
      '(4 ? 3 + 2) / 7 - 1 = 1'
    ]
    assert_equal(expected, expressions.map {|str| mystery_math(str)}) 
  end

  def test_mysterious_math
    expressions = [
      '4 + 3 - 5 = 2',
      '(4 * 3 + 2) / 7 - 1 = 1'
    ]
    expected = [
      '4 ? 3 ? 5 = 2',
      '(4 ? 3 ? 2) ? 7 ? 1 = 1'
    ]
    assert_equal(expected, expressions.map {|str| mysterious_math(str)})    
  end

  def test_danish
    strs = [
      'An apple a day keeps the doctor away',
      'My favorite is blueberry pie',
      'The cherry of my eye',
      'apple. cherry. blueberry.',
      'I love pineapple'
    ]
    expected = [
      'An danish a day keeps the doctor away',
      'My favorite is danish pie',
      'The danish of my eye',
      'danish. cherry. blueberry.',
      'I love pineapple'
    ]
    assert_equal(expected, strs.map {|str| danish(str)})
  end
  
end