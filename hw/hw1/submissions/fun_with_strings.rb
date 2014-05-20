module FunWithStrings
  def palindrome?
    str = self.gsub(/[\W]/,"").downcase
    str == str.reverse
  end
  def count_words
    self.downcase.scan(/\b\w+/).each_with_object(Hash.new(0)) {|item, memo| memo[item] += 1}
  end
  def anagram_groups
    h, a = Hash.new, Array.new

    self.split.each do |word|
      key = word.downcase.chars.sort.join.to_sym
      h.has_key?(key) ? h[key] << word : h[key] = Array.new << word
    end
    h.each_value { |val| a << val } unless h.empty?
    a        
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
