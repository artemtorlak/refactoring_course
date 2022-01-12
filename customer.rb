class Customer
  attr_reader :name, :rentals

  def initialize(name, rentals)
    @name = name
    @rentals = rentals
  end

  def statement
    total_amount = 0
    frequent_renter_points = 0
    result = "Rental information for customer: #{name} \n"

    rentals.each do |rental|
      frequent_renter_points += rental.frequent_renter_points

      # Add results for rental
      result += "#{rental.movie.title} : #{rental.charge} \n"
      total_amount += rental.charge
    end

    # Additional info
    result += "Your dept is: #{total_amount}. \n"
    result += "You got #{frequent_renter_points} points for your activity. \n"

    return result
  end
end
