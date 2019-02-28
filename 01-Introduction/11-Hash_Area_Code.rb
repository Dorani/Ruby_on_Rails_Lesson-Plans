# 1. Create a dictionary (hash) with 10 city names, where the city name (key) will be a string, and the area code would be the value, an example is given in the resources in the project video
#
# 2. Display the city names to the user for cities which are available in the dictionary
#
# 3. Get input from the user on the city name (hint: use gets.chomp method)
# 
# 4. Display area code based on user's city choice
#
# 5. Loop - keep the program running and prompt the user for new city names to lookup
#
# 6. Complete the two methods to lookup city names and to find area code based on city names



#create a dictionary of cities with area codes associated
dial_book = {
  "newyork" => "212",
  "newbrunswick" => "732",
  "edison" => "908",
  "plainsboro" => "609",
  "sanfrancisco" => "301",
  "miami" => "305",
  "paloalto" => "650",
  "evanston" => "847",
  "orlando" => "407",
  "lancaster" => "717"
}
#create a method to
def get_city_names(somehash)
  somehash.keys
end

def get_area_code(somehash, key)
  somehash[key]
end

loop do
  puts "Do you want to lookup an area code based on a city name?(Y/N)"
  answer = gets.chomp.downcase
  break if answer != "y"
  puts "Which city do you want the area code for?"
  puts get_city_names(dial_book)
  puts "Enter your selection"
  prompt = gets.chomp
  if dial_book.include?(prompt)
    puts "The area code for #{prompt} is #{get_area_code(dial_book, prompt)}"
  else
    puts "You entered a city name not in the dictionary"
  end
end
