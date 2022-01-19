require_relative 'new_release_price'
require_relative 'childrens_price'
require_relative 'regular_price'

class Movie
  attr_accessor :price_code, :title
  attr_reader :price

  CHILDRENS = 2
  NEW_RELEASE = 1
  REGULAR = 0

  def initialize(title, price_code)
    @title = title
    @price_code = price_code
    @price = initialize_price
  end

  def charge(days_rented)
    price.charge(days_rented)
  end

  def frequent_renter_points(days_rented)
    price.frequent_renter_points(days_rented)
  end

  private

  def initialize_price
    case price_code
    when CHILDRENS
      ChildrensPrice.new
    when NEW_RELEASE
      NewReleasePrice.new
    when REGULAR
      RegularPrice.new
    end
  end
end
