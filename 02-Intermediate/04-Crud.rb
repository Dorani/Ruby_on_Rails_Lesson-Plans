require 'bcrypt'

def create_hash_digest(password)
  BCrypt::Password.create(password)
end

new_password = create_hash_digest("password1")
puts new_password
