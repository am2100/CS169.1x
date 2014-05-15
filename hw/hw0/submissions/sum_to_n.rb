# num - val = remainder 

# If a subsequent val matches a previous remainder, the number can be
# successfuly made up by two members of the array.

def s2n?(arr, num)
  h = Hash.new
  arr.each { |val| return true if h.key? val ; h[num-val] = val }
  result = false
end
  
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

=begin
def sum_to_n?(array, num)
  return false if array.length < 2
  hash = Hash.new
  array.each do |val|
    puts "val: #{val}"
    p hash
    if hash.key? val
      puts "hash key #{val} already exists"
      p hash
      puts "\n\n"
      return true
    else 
      puts "hash key #{val} is unknown"
      puts "generated hash key = #{num - val}"
      hash[num-val] = val
      p hash
      puts "\n\n"
    end
  end
  return false
end
=end
