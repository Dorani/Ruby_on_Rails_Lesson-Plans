#We work with "things" ie objects created from a class
#Each instance will inherit so called features, ie:
  #properties(js) or attributes(ruby) which are all specified in the class


#Student is a class
  # attributes: fist name, last name, username, password

#Course is a class
  # attributes: course_id, short name, name, description

#Classes have a method called to_s, so by default it will always print
#something


class Student
  #gives both getters and setters for what we specify
  attr_accessor :first_name, :last_name, :user_name, :email, :password

  #for just getter functionality use, READ ONLY:
  #attr_reader :username

  #initialize method will set up our object with attr values
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

seif = Student.new("seif", "dorani", "sdot", "sd@ie.com", "password1")
john = Student.new("john", "doe", "sdot", "sd@ie.com", "password2")

puts seif
puts john



#OOP
#How do objects actually interact with one and another:
seif.last_name = john.last_name
puts "The Seif object got altered"
puts seif

#taking the seif obj, last_name, and setting it to our john obj, last_name
#this is the process of how objects interacts and design new objs
