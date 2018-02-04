def scream(words)
  words = words + "!!!"
  return
  puts words
end

scream("Yippeee")

# nothing will be printed to the screen because with no argument
# the return keyword will return nil which prints nothing to the
# screen.  The method exits on the return keyword it does not
# execute the last statement in this case.