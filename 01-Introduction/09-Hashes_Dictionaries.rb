#Common structure, open curlies
#the part is key value pais
#keys are strings, values can be anything
car = {
  "model" => "s-class",
  "color" => "blue",
  "speed" => 200,
  "fourDoor" => true
}

#Sometimes you may see the keys with simbols
# car = {
#   :model => "s-class",
#   :color => "blue",
#   :speed => 200,
#   :fourDoor => true
# }

#How to reference of a property of your Hash
puts car["model"]
puts car["color"]


#Useful methods with hashes:

#how to get only the keys in the hash:
#returns an array
car.keys

#how to only get the values
#returns an array
car.values

#looping through
car.each do |key,value|
  puts "the class for a key is #{key.class}
  and the value is #{value.class}"
end


#how to add to a hash?

myhash = {
  :a => 1,
  :b => 2,
  :c => 3,
  :d => 4
}
#to add a property to your hash
myhash[:e] = 5

#to update a hash property
myhash[:c] = "seif"
