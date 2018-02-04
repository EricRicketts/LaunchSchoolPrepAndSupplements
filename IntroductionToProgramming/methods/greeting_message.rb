def greeting(name)
  puts "Hello #{name}!!  Welcome to Launch School!!"
end

puts "Enter your full name:"
name = gets.chomp
greeting(name)