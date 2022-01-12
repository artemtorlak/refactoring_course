class Customer
  attr_reader :name, :rentals

  def initialize(name, rentals)
    @name = name
    @rentals = rentals
  end

  def statement
    result = "Rental information for customer: #{name} \n"

    rentals.each do |rental|
      # Add results for rental
      result += "#{rental.movie.title} : #{rental.charge} \n"
    end

    # Additional info
    result += "Your dept is: #{total_charge}. \n"
    result += "You got #{total_frequent_renter_points} points for your activity. \n"

    result
  end

  private

  def total_charge
    rentals.inject(0) { |sum, rental| sum + rental.charge}
  end

  def total_frequent_renter_points
    rentals.inject(0) { |sum, rental| sum + rental.frequent_renter_points }
  end
end
