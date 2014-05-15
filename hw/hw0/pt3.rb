# Define a class BookInStock which represents a book with an isbn number, isbn, 
# and price of the book as a floating-point number, price, as attributes. 
#
# The constructor should accept the ISBN number (a string) as the first argument 
# and price as second argument and should raise ArgumentError (one of Ruby's 
# built-in exception types) if the ISBN number is the empty string or if the  
# price is less than or equal to zero.
#
# Include the proper getters and setters for these attributes. 
# Include a method price_as_string that returns the price of the book with a 
# leading dollar sign and trailing zeros, that is, a price of 20 should display 
# as "$20.00" and a price of 33.8 should display as "$33.80".

class BookInStock
  attr_accessor :isbn, :price
  
  def initialize(isbn, price)
    raise ArgumentError if isbn.empty? || price <= 0
    @isbn = isbn
    @price = price.to_f
  end

  def price_as_string
    sprintf("$%.2f", @price)
  end
  
end

b1 = BookInStock.new("12345678", 10)
puts "isbn getter error" unless b1.isbn == "12345678"
puts "price getter error" unless b1.price == 10.0

b1.isbn = "87654321"
puts "isbn setter error" unless b1.isbn == "87654321"
puts "price_as_string error" unless b1.price_as_string == "$10.00"

b1.price = 33.8
puts "price setter error" unless b1.price == 33.8
puts "price_as_string format error" unless b1.price_as_string == "$33.80"

b2 = BookInStock.new("12345678", 10.3)
puts "price getter error" unless b2.price == 10.3

b3 = BookInStock.new("12345678", 10.44)
puts "price getter error" unless b3.price == 10.44

# b4 = BookInStock.new("12345678", 0)
# b5 = BookInStock.new("12345678", -1)
# b6 = BookInStock.new("", 10)

# b = BookInStock.new("12345678", 10)
# b = BookInStock.new("12345678", 10)