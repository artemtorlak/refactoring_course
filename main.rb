require_relative './movie.rb'
require_relative './rental.rb'
require_relative './customer.rb'

movie_1 = Movie.new('Regular film', 0)
movie_2 = Movie.new('New Release film', 1)
movie_3 = Movie.new('Childrens film', 2)

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
