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
      # Add additional points for frequent customer
      frequent_renter_points += 1

      # points for rental new file for 2 days
      if (rental.movie.price_code == Movie::NEW_RELEASE && rental.days_rented > 1)
        frequent_renter_points += 1
      end

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
