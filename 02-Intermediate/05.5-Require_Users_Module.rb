require_relative '05-Users_Crud_Toolkit-Module(Part2)'



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
