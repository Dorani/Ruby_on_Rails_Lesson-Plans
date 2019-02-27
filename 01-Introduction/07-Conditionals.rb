#Branching
#when this condition of true is met, it skips all and goes to end
if true
  puts "hello"
else
  puts "bye"
end

#because this is false, it will go to the else and print bye
if !true
  puts "hello"
else
  puts "bye"
end




#----------------------------------------
#Evaluate 2 conditions with and && :

condition = true
another_condition = true

if condition && another_condition
  puts "this evaluated to true"
else
  puts "this evaluated to false"
end
#both are true so it should return hello




#----------------------------------------
#Evaluate 2 conditions with and &&:

condition = true
another_condition = false

if condition && another_condition
  puts "this evaluated to true"
else
  puts "this evaluated to false"
end
#both evaluate to false so it should return bye


#----------------------------------------
#Evaluate 2 conditions with and &&:

condition = false
another_condition = false

if !condition && !another_condition
  puts "this evaluated to true"
else
  puts "this evaluated to false"
end
#both evaluate to true: ! stands for not




#----------------------------------------
#Evaluate 2 conditions with or ||:

condition = true
another_condition = false

if condition || another_condition
  puts "this evaluated to true"
else
  puts "this evaluated to false"
end
#both evaluate to true so it should return hello
#true or false will evaluate to true, see docs for me
