require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

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

  def test_anagram
    expected = [["demo", "dome", "mode"], ["none", "neon"],
    ["tied", "diet", "edit", "tide"], ["evil", "live", "veil", "vile"],
    ["fowl", "wolf", "flow"]]
    assert_equal(expected, anagram(@words))
  end

end

=begin
# book solution, I like it better

result = {}

words.each do |word|
  # alphabetize each word by sorting its characters
  key = word.split('').sort.join
  # if the key exists push it onto an array of anagrams
  # if not add the key and the original word to the hash
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

=end