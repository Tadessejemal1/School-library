# Create a class Nameable.
# Implement a method called correct_name that will raise a NotImplementedError.

class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
