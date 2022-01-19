class Movie
  attr_accessor :price
  attr_reader :title

  CHILDRENS = 2
  NEW_RELEASE = 1
  REGULAR = 0

  def initialize(title, price)
    @title = title
    @price = price
  end

  def charge(days_rented)
    price.charge(days_rented)
  end

  def frequent_renter_points(days_rented)
    price.frequent_renter_points(days_rented)
  end
end
