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
