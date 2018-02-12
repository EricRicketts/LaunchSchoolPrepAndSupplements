require 'pathname'
# first exercise in the chapter

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

# second exercise in the chapter

puts
d = Dir.new(".")
puts "find .txt extensions with Dir class:"
while file = d.read
  puts "#{file} has extension .txt" if File.extname(file) == ".txt"
end

puts
puts "find .txt extensions with Pathname class:"
pn = Pathname.new(".")
pn.entries.each {|f| puts "#{f} has extension .txt" if f.extname == ".txt"}

# delete the files to close out the exercises
File.delete("simple_text.txt")
File.delete("original_file.txt")