=begin
If you see this error, what do you suspect is the most likely problem?

NoMethodError: undefined method `keys' for Array
A. We're missing keys in an array variable.

B. There is no method called keys for Array objects.

C. keys is an Array object, but it hasn't been defined yet.

D. There's an array of strings, and we're trying to get the string keys out of the array, but it doesn't exist.

the answer is "B", the programmer is trying to call the #keys method on an Array object but #keys
does not exist as an instance method for the Array class.  
=end