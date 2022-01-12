class Movie
  attr_accessor :price_code, :title

  CHILDRENS = 2
  NEW_RELEASE = 1
  REGULAR = 0

  def initialize(title, price_code)
    @title = title
    @price_code = price_code
  end
end
