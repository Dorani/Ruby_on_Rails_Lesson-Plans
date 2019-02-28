#create a set of users that will be granted access

users = [
  {username: "seif", password:"password1"},
  {username: "dan", password:"password2"},
  {username: "sam", password:"password3"},
  {username: "stacy", password:"password4"}
]
#this is how you get a value of an arrays objects key
puts "Welcome" + " " + users[0][:username]

puts "This is our authenticator"
25.times { print "-"}
puts
puts "This program will take input from the user and compare passwords"
puts "If password is correct, you will get back the user object"



#during each loop attempts increase by 1
#until they get to 4 where it stops

attempts = 1
while attempts < 4
  puts "this will print"
  attempts += 1
end
