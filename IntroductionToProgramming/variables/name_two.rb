puts "Please enter your first name and last name: "
name = gets.chomp
puts "Greetings #{name}!!  Welcome to Launch School!!"
puts "Now I am going to say your name 10 times!"
puts "#{name}\n" * 10
puts "Now I am going to say your name again 10 times but in a different way!"
10.times {|n| puts name}