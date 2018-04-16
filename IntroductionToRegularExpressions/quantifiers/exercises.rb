require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class Exercises < Minitest::Test

  def test_exercise_one
    str = "To be or not to be\n" +
      "Be a busy bee\n" +
      "I brake for animals."
    my_regex = /\bb[a-z]*e\b/
    expected = %W(be be bee brake)
    assert_equal(expected, str.scan(my_regex))    
  end

  def test_exercise_two
    str = "What's up, doc?\n" +
      "Say what? No way.\n" + "?\n" +
      "Who? What? Where? When? How?"
    # my_regex = /\?$/ # this is my original solution
    # it is incorrect, the exercise called for matching
    # an ENTIRE LINE which ended with a quesion mark
    # expected = %W(? ? ?) # should be the entire matched line
    my_regex = /^.*\?$/
    expected = ["What's up, doc?", "?", "Who? What? Where? When? How?"]
    assert_equal(expected, str.scan(my_regex))
  end

  def test_exercise_three
    str = "What's up, doc?\n" +
      "Say what? No way.\n" + "?\n" +
      "Who? What? Where? When? How?"
    expected = ["What's up, doc?", "Who? What? Where? When? How?"]
    my_regex = /^.+\?$/
    assert_equal(expected, str.scan(my_regex))   
  end
  
  def test_exercise_four
    str = "http://launchschool.com/\n" + 
      "https://mail.google.com/mail/u/0/#inbox\n" +
      "htpps://example.com\n" +
      "Go to http://launchschool.com/\n" +
      "https://user.example.com/test.cgi?a=p&c=0&t=0&g=0 hello\n" +
      "    http://launchschool.com/\n"
=begin
    expected = ["http://launchschool.com/", "    http://launchschool.com/"]
    my_regex = /^\s*https?:\/\/.+\.com\/\s*$/
    my original solution was incorrect again due to a misunderstanding
    of the problem.  I think the problem could have been written better,
    it should have said match a line where only a valid URL exists with
    no leading spaces and ends with a white space or end of line
=end
    expected = ["http://launchschool.com/", "https://mail.google.com/mail/u/0/#inbox"]
    my_regex = /^https?:\/\/\S+$/
    assert_equal(expected, str.scan(my_regex))    
  end
  
  def test_exercise_five
    str = "http://launchschool.com/  \n" + 
      "https://mail.google.com/mail/u/0/#inbox\n" +
      "htpps://example.com\n" +
      "Go to http://launchschool.com/\n" +
      "https://user.example.com/test.cgi?a=p&c=0&t=0&g=0 hello\n" +
      "    http://launchschool.com/"
    expected = ["http://launchschool.com/  ",
      "https://mail.google.com/mail/u/0/#inbox",
      "    http://launchschool.com/"]
    my_regex = /^\s*https?:\/\/\S+\s*$/
    assert_equal(expected, str.scan(my_regex))    
  end
  
  def test_exercise_six
    str = "http://launchschool.com/\n" + 
      "https://mail.google.com/mail/u/0/#inbox\n" +
      "htpps://example.com\n" +
      "Go to http://launchschool.com/\n" +
      "https://user.example.com/test.cgi?a=p&c=0&t=0&g=0 hello\n" +
      "    http://launchschool.com/"
    expected = ["http://launchschool.com/", 
      "https://mail.google.com/mail/u/0/#inbox",
      "http://launchschool.com/",
      "https://user.example.com/test.cgi?a=p&c=0&t=0&g=0",
      "http://launchschool.com/"]
    my_regex = /\bhttps?:\/\/\S*/
    assert_equal(expected, str.scan(my_regex))    
  end
  
  def test_exercise_seven
    str = "Mississippi\n" + "ziti 0minimize7\n" +
      "inviting illegal iridium"
    my_regex = /\b([a-z]*i){3,}[a-z]*\b/i
    assert_equal(3, str.scan(my_regex).length)   
  end
  
  def test_exercise_eight
    str = "What's up, doc?\n" + "I tawt I taw a putty tat!\n" +
      "Thufferin' thuccotath!\n" + "Oh my darling, Clementine!\n" +
      "Camptown ladies sing this song, doo dah."
    my_regex = /\b\S+$/
    # books solution was /\S+$/ I think this is cleaner
    book_regex = /\S+$/
    expected = ["doc?", "tat!", "thuccotath!", "Clementine!", "dah."]
    assert_equal(expected, str.scan(my_regex))
    assert_equal(expected, str.scan(book_regex))   
  end
  
  def test_exercise_nine
    str = ",123,456,789,123,345,\n" + ",123,456,,789,123,\n" +
      ",23,56,7,\n" + ",13,45,78,23,45,34,\n" + 
      ",13,45,78,23,45,34,56,"
    my_regex = /(^,(\d+,){3,6}$)/
    expected = [",123,456,789,123,345,", ",23,56,7,", ",13,45,78,23,45,34,"]
    result = str.scan(my_regex).map {|m| m[0]}
    assert_equal(expected, result)    
  end
  
  def test_exercise_ten
    str = "123,456,789,123,345\n" + "123,456,,789,123\n" +
      "23,56,7\n" + "13,45,78,23,45,34\n" + 
      "13,45,78,23,45,34,56"
    my_regex = /(^(\d+,)(\d+,){1,4}\d+$)/
    book_regex = /(^(\d+,){2,5}\d+$)/
    expected = ["123,456,789,123,345", "23,56,7", "13,45,78,23,45,34"]
    result = str.scan(my_regex).map {|m| m[0]}
    book_result = str.scan(book_regex).map {|m| m[0]}
    assert_equal(expected, result)
    assert_equal(expected, book_result)   
  end
  
  def test_exercise_eleven
    str = "123,456,789,123,345\n" + "123,456,,789,123\n" +
      "23,56,7\n" + "13,45,78,23,45,34\n" + 
      "13,45,78,23,45,34,56"
    my_regex = /((^(\d+,){2}|^(\d+,){5,})\d+$)/
    book_regex = /(^(\d+,){2}((\d+,){3,})?\d+$)/ # I really like this solution
    # so we start with 2 number comma patterns and then we throw in 3 or more
    # number comma patterns repeated 0 or 1 time and then we end with numbers
    # and no comma
    expected = ["23,56,7", "13,45,78,23,45,34", "13,45,78,23,45,34,56"]
    result = str.scan(my_regex).map {|m| m[0]}
    book_result = str.scan(book_regex).map {|m| m[0]}
    assert_equal(expected, result)
    assert_equal(expected, book_result)
  end
  
  def test_exercise_twelve
    str = "<h1>Main Heading</h1><h1>Another Main Heading</h1>"
    my_regex = /<[hH]1>.*?<\/[hH]1>/
    expected = ["<h1>Main Heading</h1>", "<h1>Another Main Heading</h1>"]
    assert_equal(expected, str.scan(my_regex))    
  end
  
end