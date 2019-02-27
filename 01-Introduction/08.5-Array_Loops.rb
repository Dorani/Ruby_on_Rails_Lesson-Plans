z = %w(my name is seif d)

#this will give us an array of the above sentence

#what if we want to loop over this array and do something?

z.each do |word|
    print word + " "
end

#loops through each element of the array
#and prints a sentence

#can also be written like this:
z.each {|word| print word.capitalize + " "}



#Another Example:
a = (1..100).to_a.shuffle
#this will return a list of shuffled numbers

#what if i need to all odd numbers?
#loops through, and for each item, it will check if there are odd numbers
#if there is it returns an array with those numbers
a.select{|number|number.odd?}
