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
car.keys
