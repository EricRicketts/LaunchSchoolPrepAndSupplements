require 'minitest/autorun'
require 'minitest/pride'

class RegexExercise < Minitest::Test

  def has_a_b_version1(string)
    string =~ /b/ ? "match" : "no match"
  end

  def has_a_b_version2(string)
    /b/.match(string) ? "match" : "no match"
  end

  def setup
    @words = %w(basketball football hockey golf)
    @expected = %W(match match no\smatch no\smatch)
  end

  def test_version1
    results = []
    @words.each do |word|
      results.push(has_a_b_version1(word))
    end
    assert_equal(@expected, results)
  end

  def test_version2
    results = []
    @words.each do |word|
      results.push(has_a_b_version2(word))
    end
    assert_equal(@expected, results)
  end


end