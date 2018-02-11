hsh = {
  foo: "bar",
  elmer: "fudd",
  bugs: "bunny",
  daffy: "duck"
}

puts "hash keys are:"
puts hsh.keys
puts "hash values are:"
puts hsh.values
puts "hash keys and values are:"
hsh.each {|k,v| puts "key is #{k}, value is #{v}."}