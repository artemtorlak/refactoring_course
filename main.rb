require_relative 'movie'
require_relative 'rental'
require_relative 'customer'
require_relative 'new_release_price'
require_relative 'childrens_price'
require_relative 'regular_price'

new_release_price = NewReleasePrice.new
childrens_price = ChildrensPrice.new
regular_price = RegularPrice.new

movie_1 = Movie.new('Regular film', regular_price)
movie_2 = Movie.new('New Release film', new_release_price)
movie_3 = Movie.new('Childrens film', childrens_price)

rentals = []
rentals << Rental.new(movie_1, 1)
rentals << Rental.new(movie_2, 2)
rentals << Rental.new(movie_3, 3)

customer = Customer.new('Customer 1', rentals)
puts customer.statement

# Rental information for customer: Customer 1
# Regular film : 2
# New Release film : 6
# Childrens film : 1.5
# Your dept is: 9.5
# You got 4 points for your activity.
