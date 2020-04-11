# my_min
# Given a list of integers find the smallest number in the list.

# Example:

#     list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#     my_min(list)  # =>  -5

# Phase I
# First, write a function that compares each element to every other element of the list. Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
 
def my_min(list)    # time complexity : O(n**2)
    smallest = 0

    list.each do |ele|
        list.each do |ele2|
            smallest = ele if ele < smallest
        end 
    end 
    smallest 
end 


# p my_min(list)    # -5

# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. What is the time complexity?

def my_min_new(list)    # time complexity : O(n)
    smallest = 0
    list.each do |ele|
        smallest = ele if ele < smallest 
    end 
    smallest 
end 


# p my_min_new(list)    # -5

# ---------------------------------------------------------------------------

# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. 
# Find the sums of all contiguous sub-arrays and return the max.

# Example:

#     list = [5, 3, -7]
#     largest_contiguous_subsum(list) # => 8

#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7
# Example 2:

#     list = [2, 3, -6, 7, -6, 7]
#     largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
# Example 3:

#     list = [-5, -1, -3]
#     largest_contiguous_subsum(list) # => -1 (from [-1])

# Phase I
# Write a function that iterates through the array and finds all sub-arrays using nested loops. First make an array to hold all sub-arrays. 
# Then find the sums of each sub-array and return the max.

# Discuss the time complexity of this solution.


def largest_contiguous_subsum(list)       # BigO time complexity - O(n**3)     
    subs_list = []
    (0...list.length).each do |i1|    # O(n)
        (i1...list.length).each do |i2|    # O(n)
            subs_list << list[i1..i2]  # O(n) bc iterating over a range
        end 
    end 
    # p subs_list
    max = subs_list.first.sum

    subs_list.each do |sub|  #O(n**2)
        max = sub.sum if sub.sum > max   #O(n)
    end
    max
end 

# list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])


# Phase II
# Let's make a better version. Write a new function using O(n) time with O(1) memory. Keep a running tally of the largest sum. 
# To accomplish this efficient space complexity, consider using two variables. One variable should track the largest sum so far and another to track the current sum. 
# We'll leave the rest to you.


def faster_contiguous_subsum(list)      # time complexity : O(n)
    return list.max if list.all? { |num| num < 0 }  #O(n)
    
    max = list.first
    current_sum = 0
    
    list.each do |ele|   #O(n)
        current_sum += ele    #O(1)
        current_sum = 0 if current_sum < 0    #O(1)
        max = current_sum if current_sum > max    #O(1)
    end
    max 
end

# list = [5, 3, -7]
# p faster_contiguous_subsum(list) # => 8

# list = [2, 3, -6, 7, -6, 7]
# p faster_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p faster_contiguous_subsum(list) # => -1 (from [-1])
