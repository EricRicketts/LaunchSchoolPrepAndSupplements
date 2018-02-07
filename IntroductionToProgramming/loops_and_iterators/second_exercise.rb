x = 1
loop do
  puts "please input something, type \"STOP\" to exit the program: "
  answer = gets.chomp
  break if answer == "STOP"
  puts "entry number #{x} was: " + answer
  x += 1
end