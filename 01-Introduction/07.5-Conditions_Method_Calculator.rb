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
elsif user_entry == "2"
  puts "you have chose to substract"
elsif user_entry == "3"
  puts "you have chose to devide"
end
