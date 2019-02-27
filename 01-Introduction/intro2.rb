          #String concatenation
#be mindful with single quotes you can use string interpolation
first_name = "seif"
last_name = "delta"
age = 32
puts first_name + " " + last_name


          #String interpolation
puts "My first name is #{first_name} and my is #{last_name}"


          #Methods, how to find them
first_name.class
"delta".class
#will return the type of data structure
#you can invoke methods on primitive types which is cool!

#to see all the methods available for our datatype:
first_name.methods

#after seeing all the methods on a data type
#you can use one, and chain another method on top of it!

          #Common Methods
age.to_s.class
#this will switch the type of to a string and get the class on it

full_name.length
#will give you the entire length of the data type + spaces

full_name.reverse
#reverses the data type, notice how this can be used on both arrays and ints

full_name.capitalize
#caps first letter

full_name.empty?
#will check if this data type is empty, use ? on methods

full_name.nil?
#everything has some type of value so it will be false, even if its an empty String

sentence = "welcome to the jungle"
sentence.sub("the jungle", "utopia") #can use
puts sentence
#sub method, with substitute values from a datatype
#first parameter is the sub items and the 2nd is the new values



              #Variable Assigment
first_name = "seif"
new_first_name = first_name
#pass by value and reference keep in mind that
#if a var is pointing to another var, its pointing to that location in memory




#Escaping
