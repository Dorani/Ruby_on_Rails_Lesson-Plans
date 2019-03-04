# User case for student class - authentication systems in web applications
# For now think of students as users
# Done with usernames and passwords
# Security for user information is very important
# Passwords are virtually never stores in their string forms
# Hashed digests are stored in dbs
# In popular hashing algorithm in MD5 - bcrypt
# Creates a hash digest of the string as password

#don't forget to 'gem install bcrypt'


#obtained from the docs, require tech
require 'bcrypt'
#create a var to hold the creation of a hashed version of 'my password' using salt
my_password = BCrypt::Password.create("my password")
#=> "$2a$12$K0ByB.6YI2/OYrB4fQOYLe6Tv0datUVf6VZ/2Jzwm879BW5K1cHey"
puts my_password
#we create a password using .create

# my_password = BCrypt::Password.new("$2a$12$K0ByB.6YI2/OYrB4fQOYLe6Tv0datUVf6VZ/2Jzwm879BW5K1cHey")
# my_password == "my password"     #=> true
# my_password == "not my password" #=> false

#The reason why this is cool is because now we can create
#multiple instances with the create method of the same string
#and everytime when you take the string and run this bcrypt::password create
#with the addition of the salt it won't create the same string
