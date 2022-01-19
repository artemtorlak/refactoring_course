require_relative 'new_release_price'
require_relative 'childrens_price'
require_relative 'regular_price'

class Movie
  attr_accessor :price_code, :title

  CHILDRENS = 2
  NEW_RELEASE = 1
  REGULAR = 0

  def initialize(title, price_code)
    @title = title
    @price_code = price_code
    @price = initialize_price
  end

  def charge(days_rented)
    result = 0

    case price_code
    when CHILDRENS
      result += 1.5
      if(days_rented > 3)
        result += (days_rented - 3) * 1.5
      end
    when NEW_RELEASE
      result += days_rented * 3
    when REGULAR
      result += 2
      if(days_rented > 2)
        result += (days_rented - 2) * 1.5
      end
    end

    result
  end

  def frequent_renter_points(days_rented)
    (price_code == NEW_RELEASE && days_rented > 1) ? 2 : 1
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
