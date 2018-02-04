def multiply(a, b)
  a * b
end

puts "Enter the first number to be multiplied: "
a = gets.chomp.to_i
puts "Enter the second number to be multiplied: "
b = gets.chomp.to_i
puts "The product of the two numbers is: #{multiply(a, b)}"