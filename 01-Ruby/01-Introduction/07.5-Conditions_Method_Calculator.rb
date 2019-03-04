def multiply(num1,num2)
  num1.to_f * num2.to_f
end

def devide(num1,num2)
  num1.to_f / num2.to_f
end

def substract(num1,num2)
  num1.to_f - num2.to_f
end

def add(num1,num2)
  num1.to_f + num2.to_f
end


puts "Simple Calculator"
20.times {print "-"}
puts
puts "input a number"
number1 = gets.chomp
puts "input a 2nd number"
number2 = gets.chomp

puts "what do you want to do?"
puts "enter 1 for multiply, 2 for substract, 3 for devide"

user_entry = gets.chomp

if user_entry == "1"
  puts "you have chose to multiply"
  result = multiply(number1, number2)
  puts "The result is: #{result} "
elsif user_entry == "2"
  puts "you have chose to substract"
  result = substract(number1, number2)
  puts "The result is: #{result} "
elsif user_entry == "3"
  puts "you have chose to devide"
  result = devide(number1, number2)
  puts "The result is: #{result} "
end
