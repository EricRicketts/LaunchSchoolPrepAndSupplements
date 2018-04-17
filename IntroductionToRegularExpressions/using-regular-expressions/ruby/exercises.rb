require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class Exercises < Minitest::Test

  def url?(str)
    str.match?(/\Ahttps?:\/\/\S+\z/)
  end

  def test_url
    urls = ['http://launchschool.com', 'https://example.com',
      'https://example.com hello', '   https://example.com']
    expected = [true, true, false, false]
    assert_equal(expected, urls.map {|str| url?(str)})
  end
  
end