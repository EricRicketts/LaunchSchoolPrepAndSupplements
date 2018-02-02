puts "How old are you?"
age = gets.chomp.to_i
[10, 20, 30, 40].each do |age_adder|
  puts "In #{age_adder} years you will be:"
  puts "#{age + age_adder}"
end