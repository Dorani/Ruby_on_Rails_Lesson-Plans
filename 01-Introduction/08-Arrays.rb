#Ordered list of items
#each items can be any type of data strucutre
#it also maintaints an index to represents the location of the element
#Ruby has powerful methods on this data structure

a = [1,2,3,4,5,6,7]
puts a
#this call put string on each element so it will create new lines

print a
#prints the array as is

p a
#accomplishes same as above

p a.last
#prints the last elements of the array

#Activity:
#In your terminal to establish a range of numbers

x = 1..100
x.class
#will out put Range
x.to_a
#will render your entire range in array type format
x.to_a.shuffle
#will render a randomized array of elements ranging from 1..100
#now if you print out x again it will just show the range
#to maintain the shuffled list of items do this:
z = x.to_a.shuffle
z
#by reasigning and holding it in memory, it works



#Activity2
#we can mutate the caller by using bang !

y = (1..10).to_a
y.reverse!
y
# and you will see a maintained reversed list on y


#Activity3

x = "a".."z"
z = x.to_a
z.length
#creates a range of letters
#gets the length

z << 10
#this will add the number 10 to the end list of letters

z.last
z.first
#gets the last and first elements

z.unshift("seif")
#adds to the begining of the array

z.include("seif")
#will test to see if you have an item in your array

z.push("new item")
#adds new item to the array

b = z.pop
#last in first out
#will remove the last item from z and store it in b

str = z.join(-)
#takes all the elements of the z array and
#returns a string with dashes in between

arr = str.split(-)
#splits each item and
#returns it back to an array where there is a -

%w("hello world")
#this command will just convert it to an array
