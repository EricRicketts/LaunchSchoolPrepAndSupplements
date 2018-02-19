require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class Exercises < Minitest::Test

  def setup
    @ary = (1..10).to_a
    @word_arr = %W(snow winter ice slippery salted\sroads white\strees)
    @result = []
  end

  def test_each_over_array
    @ary.each {|element| @result.push(element)}
    assert_equal(@ary, @result)
  end

  def test_use_each_to_filter
    expected = (6..10).to_a
    @ary.each {|element| @result.push(element) if element > 5}
    assert_equal(expected, @result)
  end

  def test_use_select_to_filter
    expected = (1..10).step(2).to_a
    result = @ary.select {|number| number.odd?}
    assert_equal(expected, result)
  end

  def test_prepend_and_append
    @ary.push(11).unshift(0)
    assert_equal((0..11).to_a, @ary)
  end

  def test_prepend_append_pop
    expected = (0..10).to_a.push(3)
    @ary.push(11).unshift(0).pop(1)
    @ary.push(3)
    assert_equal(expected, @ary)
  end

  def test_remove_duplicates
    expected = (0..10).to_a
    @ary.push(11).unshift(0).pop(1)
    @ary.push(3)
    assert_equal(expected, @ary.uniq)    
  end

=begin
an array is an ordered collection of objects, accessed by its indices which begin
at 0.  A hash is a keyed collection of objects, where access to the element is achieved
by knowing the key of that value
=end

  def test_create_hash
    hsh_a = {one: 1, two: 2, three: 3} 
    hsh_b = {:one => 1, :two => 2, :three => 3}
    assert(hsh_a == hsh_b)
  end

  def test_create_and_modify_hash
    hsh = {a: 1, b: 2, c: 3, d: 4}
    assert(hsh[:b] == 2)
    hsh[:e] = 5
    assert({a: 1, b: 2, c: 3, d: 4, e: 5} == hsh)
    result = hsh.select {|key, value| value > 3.5}
    assert({d: 4, e: 5} == result)
  end

  def test_hsh_array_values_and_array_of_hashes
    hsh = {a: [1, 2], b: [3, 4]}
    ary = [{a: 1}, {b: 2}, {c: 3}]
    assert_instance_of(Array, hsh[:a])
    assert_instance_of(Hash, ary[0])
  end

=begin
  
right now I like ruby-doc because it is the one I am
most familiar with  
=end

  def test_move_array_data_to_hash
    # this test really covered exercises 12, 13, and 14. 
    contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
      ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
    contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
    contact_data.each do |data|
      email = data[0].downcase
      name = email.match(/(\w+)@/)[1]
      key = contacts.keys.select {|full_name| full_name.downcase.include?(name)}
      unless key.empty?
        contacts[key.first][:email] = data[0]
        contacts[key.first][:address] = data[1]
        contacts[key.first][:phone_number] = data[2]
      end
    end 
    joe_smith = [contacts["Joe Smith"][:email], contacts["Joe Smith"][:address],
      contacts["Joe Smith"][:phone_number]]
    sally_johnson = [contacts["Sally Johnson"][:email], contacts["Sally Johnson"][:address],
      contacts["Sally Johnson"][:phone_number]]
    assert_equal(contact_data[0], joe_smith)  
    assert_equal(contact_data[1], sally_johnson)  
  end

  def test_delete_words
    @word_arr.delete_if {|word| word.start_with?('s')}
    expected = %W(winter ice white\strees)
    assert_equal(expected, @word_arr)
  end

  def test_delete_more_words
    @word_arr.delete_if {|word| word.start_with?('s') || word.start_with?('w')}
    # book solution is better @word_arr.delete_if {|word| word.start_with?('s', 'w')}
    expected = %W(ice)
    assert_equal(expected, @word_arr)
  end

  def test_make_two_words_into_one_word
    a = ['white snow', 'winter wonderland', 'melting ice',
      'slippery sidewalk', 'salted roads', 'white trees']
     expected = %W(white snow winter wonderland melting ice
      slippery sidewalk salted roads white trees)
    result = a.map {|word_pair| word_pair.split}.flatten
    assert_equal(expected, result)
  end

  def test_are_hashes_the_same
    hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
    hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}
    assert(hash1 == hash2)
  end


end