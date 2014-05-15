# Define a method hello(name) that takes a string representing a name and returns the string "Hello, " concatenated with the name.
def hello (name)
  "Hello, #{name}"
end

raise "Incorrect string error" if hello("Frederic") != "Hello, Frederic"
raise "Empty string error" if hello("") != "Hello, "



# Define a method starts_with_consonant?(s) that takes a string and returns true if it starts with a consonant and false otherwise. 
# (For our purposes, a consonant is any letter other than A, E, I, O, U.) 
# NOTE: be sure it works for both upper and lower case and for nonletters!

def starts_with_consonant?(s)
  regex = /\A[BCDFGHJKLMNPQRSTVWXYZ]/i
  s =~ regex ? true : false 
end


raise "uppercase consonant error" unless starts_with_consonant?('Jim')
raise "lowercase consonant error" unless starts_with_consonant?('jim')
raise "uppercase vowel error" unless !starts_with_consonant?('England')
raise "lowercase vowel error" unless !starts_with_consonant?('england')
raise "empty string is not a consonant" unless !starts_with_consonant?('')
raise "non letters is not a consonant" unless !starts_with_consonant?('---hey---')
raise "numbers is not a consonant" unless !starts_with_consonant?('4 is great')


# Define a method binary_multiple_of_4?(s) that takes a string and returns true if the string represents a binary number that is a multiple of 4. 
# NOTE: be sure it returns false if the string is not a valid binary number! 

def bm4?(s)
  regex = /\A(0|1)+\z/
  p s.to_i(2)
  s =~ regex && (s.to_i(2) % 4).zero?
end

def bm4b?(s)
  if (s == '0' | s == '00')
    return true
  end
  return 0 == (s =~ /^[01]*00$/)
end

raise "String not binary multiple of 4" unless !bm4?("1234jfhs")
raise "String not binary multiple of 4" unless !bm4?("abcde")
raise "String not binary multiple of 4" unless !bm4?("1010x00")
raise "String binary not multiple of 4" unless !bm4?("1010101")
raise "String binary not multiple of 4" unless !bm4?("1")
raise "Binary multiple of 4 not recognised" unless bm4?("10100")
raise "Binary multiple of 4 not recognised" unless bm4?("0")
raise "Binary multiple of 4 not recognised" unless bm4?("00")
raise "Binary multiple of 4 not recognised" unless bm4?("000")


