class Customer
  attr_reader :name, :rentals

  def initialize(name, rentals)
    @name = name
    @rentals = rentals
  end

  def statement
    frequent_renter_points = 0
    result = "Rental information for customer: #{name} \n"

    rentals.each do |rental|
      frequent_renter_points += rental.frequent_renter_points

      # Add results for rental
      result += "#{rental.movie.title} : #{rental.charge} \n"
    end

    # Additional info
    result += "Your dept is: #{total_charge}. \n"
    result += "You got #{frequent_renter_points} points for your activity. \n"

    return result
  end

  private

  def total_charge
    rentals.inject(0) { |sum, rental| sum + rental.charge}
  end
end
