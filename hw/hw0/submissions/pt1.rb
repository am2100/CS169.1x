# Define a method sum which takes an array of integers as an argument
# and returns the sum of its elements. For an empty array it should
# return zero.

def sum(a)
  a.length > 0 ? a.inject(:+) : 0
end

# Define a method max_2_sum which takes an array of integers as an
# argument and returns the sum of its two largest elements. For an
# empty array it should return zero. For an array with just one
# element, it should return that element.

def max_2_sum(a)
  a.length > 0 ? a.sort.pop(2).inject(:+) : 0
end

# Define a method sum_to_n? which takes an array of integers and an
# additional integer, n, as arguments and returns true if any two
# distinct elements in the array of integers sum to n. An empty array
# or single element array should both return false.

def sum_to_n?(a, n)
  result = false

  while a.length > 1
    e1 = a.slice!(0)
    a.each {|e2| e2 + e1 == n ? result = true : break }
  end

  result
end
