# def equal_to_four(x)
#   if x == 4
#     puts "yup"
#   else
#     puts "nope"
# end

# equal_to_four(5)

# when called gets the following error:

# exercise.rb:8: syntax error, unexpected end-of-input, expecting keyword_end

# add and 'end' keyword to close out the if conditional statement:
# if x == 4
#   puts "yup"
# else
#   puts "nope"
# end

# the interpreter matches any given 'end' keyword with its closest begin or implied begin
# in this case 'end' is matched with the if conditional leaving the method 'equal_to_four' 
# unclosed with an 'end' keyword