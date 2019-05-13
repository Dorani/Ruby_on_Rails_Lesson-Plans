require_relative '05-Users_Crud_Toolkit-Module(Part2)'


#include the module in the class first
class Student
  include Crud
  attr_accessor :first_name, :last_name, :user_name, :email, :password

  def initialize(first_name, last_name, user_name, email, password)
    @first_name = first_name
    @last_name = last_name
    @user_name = user_name
    @email = email
    @password = password
  end

  #method to display object attr
  def to_s
    "First name: #{first_name},
     Last name: #{last_name}
     User name: #{user_name}
     Email: #{email}
     password: #{password}"
  end

end


#Create the instances
seif = Student.new("seif", "dorani", "sdot", "sd@ie.com", "password1")
john = Student.new("john", "doe", "sdot", "sd@ie.com", "password2")

#in order to use the methods from the toolkit on the instances
#that i created you will need to add require require_relative path of File
#and you will need to include the module within the classe
#then following line can work on your instances

hashed_password = seif.create_hash_digest(seif.password)
puts hashed_password
