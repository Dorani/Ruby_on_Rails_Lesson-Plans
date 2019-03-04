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

def create_secure_users(list_of_users)
  list_of_users.each do |user_record|
    puts user_record[:password]
  end
end

create_secure_users(users)
