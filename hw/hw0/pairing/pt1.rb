# Define a method sum which takes an array of integers as an argument and returns the sum of its elements. 
# For an empty array it should return zero.

def sum(array)
  #return 0 if array.empty?
  #array.reduce(:+)
  
  array.length > 0 ? array.inject(:+) : 0
end

# a = [2,3,4,5]

# p sum(a)
raise "failed sum[(2,3,4,5])" unless sum([2,3,4,5]) == 14

## Sum some numbers
#(5..10).reduce(:+)                            #=> 45

# Define a method max_2_sum which takes an array of integers as an argument and returns the sum of its two largest elements. 
# For an empty array it should return zero. For an array with just one element, it should return that element.

def max_2_sum array
  # return 0 if array.empty?
  # return array[0] if array.length == 1
  # array.sort![-1] + array[-2]
  array.length > 0 ? array.sort.pop(2).inject(:+) : 0
end

raise "failed empty array test" unless max_2_sum([]) == 0
raise "failed one element array test" unless max_2_sum([3]) == 3
raise "failed two element array test" unless max_2_sum([3, 4]) == 7
raise "failed n element array test" unless max_2_sum([3, 23, 54, 6]) == 77

# Define a method sum_to_n? which takes an array of integers and an additional integer, n, as arguments and 
# returns true if any two distinct elements in the array of integers sum to n. 
# An empty array or single element array should both return false. 

# Jim(US) v1
def sum_to_n?(array, num)
  return false if array.length < 2
  hash = Hash.new
  array.each do |val|
    if hash.key? val
      return true
    else 
      hash[num-val] = val
    end
  end
  return false
end

raise "Jim(US) failed empty array test" unless sum_to_n?([], 6) == false
raise "Jim(US) failed single element array test" unless sum_to_n?([3], 6) == false
raise "Jim(US) failed single element array test" unless sum_to_n?([6], 6) == false
raise "Jim(US) failed array test" unless sum_to_n?([6,5,4,3], 11) == true
raise "Jim(US) failed array test" unless sum_to_n?([6,5,4,3], 1) == false
raise "Jim(US) failed array test" unless sum_to_n?([6,5,4,3], 6) == false
raise "Jim(US) failed array test" unless sum_to_n?([6,5,4,3,7], 7) == true
raise "Jim(US) failed array test" unless sum_to_n?([6,5,6,5,7], 10) == true
raise "Jim(US) failed array test" unless sum_to_n?([6,5,6,8,7], 10) == false

# Frederic v1

def fr_sum_to_n? (array, n)
  return false if array.length < 2
  while (val  = array.pop) != nil do
    array.each do |x|
      if (x + val == n) then return true
      end
    end
  end
  return false
end

raise "Frederic failed empty array test" unless fr_sum_to_n?([], 6) == false
raise "Frederic failed single element array test" unless fr_sum_to_n?([3], 6) == false
raise "Frederic failed single element array test" unless fr_sum_to_n?([6], 6) == false
raise "Frederic failed array test" unless fr_sum_to_n?([6,5,4,3], 11) == true
raise "Frederic failed array test" unless fr_sum_to_n?([6,5,4,3], 1) == false
raise "Frederic failed array test" unless fr_sum_to_n?([6,5,4,3], 6) == false
raise "Frederic failed array test" unless fr_sum_to_n?([6,5,4,3,7], 7) == true
raise "Frederic failed array test" unless fr_sum_to_n?([6,5,6,5,7], 10) == true
raise "Frederic failed array test" unless fr_sum_to_n?([6,5,6,8,7], 10) == false

# Jim(UK) v1

def s_2_n?(array, num)
  result = false
  
  while array.length > 1
    e1 = a.slice!(0)
    a.each {|e2| e2 + e1 == n ? result = true : break }
  end

  return result
end

# Jim(UK)'s refactoring of Jim(US)'s rocking hash based sum_to_n? method

# num - val = remainder

# If a subsequent val matches a previous remainder, the number can be
# successfully made up by two members of the array.

def s2n?(arr, num)
  h = Hash.new
  arr.each { |val| return true if h.key? val ; h[num-val] = val }
  false
end

raise "Jim(UK) failed empty array test" unless s2n?([], 6) == false
raise "Jim(UK) failed single element array test" unless s2n?([3], 6) == false
raise "Jim(UK) failed single element array test" unless s2n?([6], 6) == false
raise "Jim(UK) failed array test" unless s2n?([6,5,4,3], 11) == true
raise "Jim(UK) failed array test" unless s2n?([6,5,4,3], 1) == false
raise "Jim(UK) failed array test" unless s2n?([6,5,4,3], 6) == false
raise "Jim(UK) failed array test" unless s2n?([6,5,4,3,7], 7) == true
raise "Jim(UK) failed array test" unless s2n?([6,5,6,5,7], 10) == true
raise "Jim(UK) failed array test" unless s2n?([6,5,6,8,7], 10) == false
