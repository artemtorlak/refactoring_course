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
      this_amount = amount_for(rental)

      # Add additional points for frequent customer
      frequent_renter_points += 1

      # points for rental new file for 2 days
      if (rental.movie.price_code == Movie::NEW_RELEASE && rental.days_rented > 1)
        frequent_renter_points += 1
      end

      # Add results for rental
      result += "#{rental.movie.title} : #{this_amount} \n"
      total_amount += this_amount
    end

    # Additional info
    result += "Your dept is: #{total_amount}. \n"
    result += "You got #{frequent_renter_points} points for your activity. \n"

    return result
  end

  private 

  def amount_for(rental)
    result = 0

    case rental.movie.price_code
    when Movie::CHILDRENS
      result += 1.5
      if(rental.days_rented > 3)
        result += (rental.days_rented - 3) * 1.5
      end
    when Movie::NEW_RELEASE
      result += rental.days_rented * 3
    when Movie::REGULAR
      result += 2
      if(rental.days_rented > 2)
        result += (rental.days_rented - 2) * 1.5
      end
    end

    result
  end
end