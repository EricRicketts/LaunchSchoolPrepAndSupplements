person = { name: 'Bob', height: '6ft', weight: 160, hair: 'brown' }
person.each do |key, value|
  puts "Bob's #{key} is #{value}."
end