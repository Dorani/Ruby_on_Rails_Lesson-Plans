module Crud
  require 'bcrypt'
  #creation method
  def create_hash_digest(password)
    BCrypt::Password.create(password)
  end

  #verify method
  def verify_hash_digest(password)
    BCrypt::Password.new(password)
  end

  #hash passwords with salt tech
  def create_secure_users(list_of_users)
    list_of_users.each do |user_record|
      user_record[:password] = create_hash_digest(user_record[:password])
    end
    list_of_users
  end


  #authenticate users
  def authenticate_user(username, password, list_of_users)
    list_of_users.each do |user_record|
      if user_record[:username] == username &&
        verify_hash_digest(user_record[:password]) == password
        return user_record
      end
    end
    "Credentials are not correct"
  end
end

#self is a class method, it does not require
#an instance of an obj to make it work
