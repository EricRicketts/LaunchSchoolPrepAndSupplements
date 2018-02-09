arr = (1..11).step(2).to_a
number = 3
arr.include?(number) ? puts("The number #{number} appears in #{arr}") : puts("The number #{number} does not appear in #{arr}")