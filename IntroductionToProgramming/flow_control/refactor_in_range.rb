puts "Enter a number between 0 and 100 inclusive: "
number = gets.chomp.to_i

def in_range(number)
  case
  when number < 0
    puts "You cannot enter a number less than 0!"
  when (0..50).include?(number)
    puts "The number is between 0 and 50"
  when (51..100).include?(number)
    puts "The number is between 51 and 100"
  else
    puts "The number is over 100"
  end
end 

if number < 0
  puts "You cannot enter a number less than 0!"
elsif number <= 50
  puts "The number is between 0 and 50"
elsif number <= 100
  puts "The number is between 51 and 100"
else
  puts "The number is over 100"
end

in_range(number)
    
