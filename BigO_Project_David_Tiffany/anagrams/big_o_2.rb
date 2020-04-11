# Aiiirrrsssttt___nagrams
# Our goal today is to write a method that determines if two given words are anagrams. 
# This means that the letters in one word can be rearranged to form the other word. For example:

# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true
# Assume that there is no whitespace or punctuation in the given strings.



# Phase I:
# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. Check if the second string is one of these.

# Hints:

# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings?

def first_anagram?(str1, str2)      # O(n**3)
    anagrams = []

    count = 0
    (1..str1.length-1).each do |num| # O(n)
        count += num * (num + 1)
    end 

    while anagrams.length < count   # O(n)
        ana = str1.split("").shuffle.join   # O(n**2)
        anagrams << ana if !anagrams.include?(ana) # O(n)
    end 

    anagrams.include?(str2)
end 

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

# p first_anagram?("njkasndjkasdnjsandjsldnkasdklsdmnlksandlsnksna", "jkasndjkasdnjsandjsldnkasdklsdmnlksandlsnksnan")    # true



# ---------------------------------------------------------------------------

# Phase II:
# Write a method #second_anagram? that iterates over the first string. 
# For each letter in the first string, find the index of that letter in the second string (hint: use Array#find_index) and delete at that index. 
# The two strings are anagrams if an index is found for every letter and the second string is empty at the end of the iteration.

# Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram??

def second_anagram?(str1, str2)   # O(n**2)
    str1.each_char do |ele|   # O(n)
        str2.delete!(ele)    # O(n)
    end 
    str2.empty?
end 


# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

# p second_anagram?("njkasndjkasdnjsandjsldnkasdklsdmnlksandlsnksna", "jkasndjkasdnjsandjsldnkasdklsdmnlksandlsnksnan")    # true

# ---------------------------------------------------------------------------
# Phase III:
# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically. 
# The strings are then anagrams if and only if the sorted versions are the identical.

# What is the time complexity of this solution? Is it better or worse than #second_anagram??

def third_anagram?(str1, str2)    # O(n**3 ?????????)
    str1.split("").sort.join == str2.split("").sort.join
end 

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

#  p third_anagram?("njkasndjkasdnjsandjsldnkasdklsdmnlksandlsnksna", "jkasndjkasdnjsandjsldnkasdklsdmnlksandlsnksnan")    # true


# ---------------------------------------------------------------------------
# Phase IV:
# Write one more method #fourth_anagram?. This time, use two Hashes to store the number of times each letter appears in both words. Compare the resulting hashes.

# What is the time complexity?

# Bonus: Do it with only one hash.

def fourth_anagram?(str1, str2)    # O(n)
    hash = Hash.new(0)
    str1.each_char { |char| hash[char] += 1} 

    hash2 = Hash.new(0)
    str2.each_char { |char| hash2[char] += 1}

    hash == hash2
end 

# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true

# p third_anagram?("njkasndjkasdnjsandjsldnkasdklsdmnlksandlsnksna", "jkasndjkasdnjsandjsldnkasdklsdmnlksandlsnksnan")    # true