# To create a hash called my_details include the elements within { }:

my_details = {'name' => 'mashrur', 'favcolor' => 'red'}

# To access the value and notify me what favcolor is:

my_details["favcolor"]

# Alternate syntax to create key, value pairs in hash:

myhash = {a: 1, b: 2, c: 3, d: 4}

# But this will create symbols a, b, c and d (not strings) as keys

# To access the value for key c above:

myhash[:c]

# To add a key, value pair to the hash above:

myhash[:d] = 7

myhash[:name] = "Mashrur"

# To delete a key, value pair simply delete the key:

myhash.delete(:d)

# To list the keys in a hash, followed by values of the hash:

myhash.keys
myhash.values

# To iterate through a hash using .each method and print out value:

myhash.each { |somekey, somevalue| puts somevalue }

# To iterate through a hash using .each method and print out both key and value in friendly format:

myhash.each { |somekey, somevalue| puts "The key is #{somekey} and the value is #{somevalue}" }

# To iterate through and delete a items from a hash based on a condition (in the condition below if the value is greater than 3:

myhash.each { |k, v| myhash.delete(k) if v > 3 }

# Use select method to display items only if value of the item is odd

myhash.select { |k, v| v.odd? }
