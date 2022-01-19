class BasePrice

  def charge
    raise NotImplementedError, "#{self.class} has not implemented method charge"
  end

  def frequent_renter_points(days_rented)
    1
  end
end
