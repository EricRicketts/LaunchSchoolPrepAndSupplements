require 'minitest/autorun'
require 'minitest/pride'

class SixthExercise < Minitest::Test

  def setup
    @words = %w(demo none tied evil dome mode live
    fowl veil wolf diet vile edit tide flow neon)
  end

  def anagram(words)
    hsh = {}
    words.each {|word| hsh[word.to_sym] = nil}
    hsh.each do |key, value|
      hsh[key] = @words.select {|word| word.chars.sort == key.to_s.chars.sort}
    end.values.uniq
  end

  def anagram_two(words)
    # this solution is based on the book solution, you only cycle through the
    # given array one time where the anagram method in essence does it twice
    result = {}
    words.each do |word|
      # sort the characters in the word to make a key
      key = word.chars.sort.join.to_sym
      # if the key is present after sorting the letters of the word then
      # add the word to the array of anagrams for that word
      result.has_key?(key) ? result[key].push(word) : result[key] = [word]
    end
    result
  end

  def test_anagram
    expected = [["demo", "dome", "mode"], ["none", "neon"],
    ["tied", "diet", "edit", "tide"], ["evil", "live", "veil", "vile"],
    ["fowl", "wolf", "flow"]]
    assert_equal(expected, anagram(@words))
    assert_equal(expected, anagram_two(@words).values)
  end

end