require_relative 'base_price'

class NewReleasePrice < BasePrice

  def charge(days_rented)
    days_rented * 3
  end
end
