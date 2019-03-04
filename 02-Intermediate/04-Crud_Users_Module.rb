require 'bcrypt'


#users data:
users = [
  {username: "seif", password:"password1"},
  {username: "dan", password:"password2"},
  {username: "sam", password:"password3"},
  {username: "stacy", password:"password4"},
  {username: "carl", password:"password5"}
]


#creation method
def create_hash_digest(password)
  BCrypt::Password.create(password)
end

#verify method
def verify_hash_digest(password)
  BCrypt::Password.new(password)
end


# real purpose here will be to take in the users data
# and for each user execute my create_hash_digest method on each password field

def create_secure_users(list_of_users)
  list_of_users.each do |user_record|
    user_record[:password] = create_hash_digest(user_record[:password])
  end
  list_of_users
end

new_users = create_secure_users(users)
puts new_users

#Now we need a way to authenticate users

def authenticate_user(username, password, list_of_users)
  list_of_users.each do |user_record|
    if user_record[:username] == username &&
      verify_hash_digest(user_record[:password]) == password
      return user_record
    end
  end
  "Credentials are not correct"
end

puts authenticate_user("carl", "password5", new_users)
