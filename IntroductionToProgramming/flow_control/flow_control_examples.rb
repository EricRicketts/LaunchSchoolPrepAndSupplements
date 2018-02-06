x = 3
if x == 3
  y = x
end
puts y # should print 3

x = 4
if x == 3
  z = x
elsif x == 4
  z = x
end
puts z # should print 4

x = 5
if x == 3
  a = x
else
  a = "x is not 3"
end
puts a # should print "x is not 3"

x = 6
if x == 6 then puts 6 end

x = 7

result = (x > 6 && x < 10) ? "x is greater than 6 and less than 10" : "x is less than 6 or greater than 10"
puts result

c = 5
case c
  when 3
    puts "c is 3"
  when 4
    puts "c is 4"
  else
    puts "c is not 3 or 4"
end

d = 4
case
  when d == 3
    puts "d is 3"
  when d == 4
    puts "d is 4"
  else
    puts "d is not 3 or 4"
end


    