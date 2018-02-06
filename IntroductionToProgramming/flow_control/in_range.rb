puts "Enter a number between 0 and 100 inclusive: "
number = gets.chomp.to_i

case
when number < 0
  puts "You cannot put in a number less than 0!"
when (0..50).include?(number)
  puts "The number is between 0 and 50"
when (51..100).include?(number)
  puts "The number is between 51 and 100"
else
  puts "The number is over 100"
end 