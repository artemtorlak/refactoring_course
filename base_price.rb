class BasePrice

  def charge
    raise NotImplementedError, "#{self.class} has not implemented method charge"
  end
end
