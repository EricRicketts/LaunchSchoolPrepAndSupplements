def greeting(name, options = {})
  if options.empty?
    puts "Hello, my name is #{name}."
  else
    puts "Hello, my name is #{name} and I'm #{options[:age]}" +
    " years old and I live in #{options[:city]}."
  end 
end

greeting("Bob")
greeting("Bob", {age: 62, city: "New York City"})
# hash braces are optional when the hash is last in
# the argument list
greeting("Eric", age: 57, city: "Gainesville, VA")