File.open("simple_text.txt", "w+") do |file|
  file.write("Another example of writing to a file.\n")
  file.write("Here we are with a new line of text.")
  file.write("Writing to a file in Ruby is easy.")
end

puts "output from simple_text.txt:"
puts File.read("simple_text.txt")
simple = File.read("simple_text.txt")

original = File.new("original_file.txt", "w+")
File.open(original, "a") {|file| file.puts simple}

puts
puts "output from original_file.txt"
puts File.read(original)

File.delete("simple_text.txt")
File.delete("original_file.txt")