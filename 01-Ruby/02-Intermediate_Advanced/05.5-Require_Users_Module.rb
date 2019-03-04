require_relative '05-Users_Crud_Toolkit-Module(Part2)'

# created a module with 4 methods, which we are calling our toolkit,
# and in our program we were able to use it in our program file of 05.5

#users data:
users = [
  {username: "seif", password:"password1"},
  {username: "dan", password:"password2"},
  {username: "sam", password:"password3"},
  {username: "stacy", password:"password4"},
  {username: "carl", password:"password5"}
]


hashed_users = Crud.create_secure_users(users)
puts hashed_users
