def change_to_all_caps(string)
  string.length > 10 ? string.upcase : string
end

puts change_to_all_caps("Hello World!!")
puts change_to_all_caps("foo bar")