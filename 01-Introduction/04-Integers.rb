# #simple math
# puts 10 / 2
#
# puts 2 * 5
#
# puts 5 - 4
#
# puts 10 / 4
# #this will return 2, cause it removes the decimal
# #we can fix this:
#
# puts 10 / 4.to_f
# #.to_f is the method for floats, which converts it to a float
#
#
#
# #store numbers in vars and do some math!
# x = 5
# y = 10
# puts y / x
#
#
# #string concatenation allows this awesome feature
# puts "-" * 20
#
# #another cool way
# 20.times {print "-"}
# 20.times {puts "hello loves"}
#
# #how about displaying, 20 random numbers between 0-9
# 20.times {puts rand(10)}
#
# #rand will generate a rand number between 0-1
#



          #calculator program
puts "Simple Calculator"
20.times {print "-"}
puts
puts "input a number"
number1 = gets.chomp
puts "input a 2nd number"
number2 = gets.chomp

puts "the first num multiplied by the second
is #{number1.to_i * number2.to_i}"
