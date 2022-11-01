# Make sure that it inherits from Nameable.
# In the constructor assign a nameable object from params to an instance variable.
# Implement the correct_name method that returns the result of the correct_name method of the @nameable.

class NameDecorator < Nameable
  attr_accessor :nameable

  # @param [Nameable] component
  def initialize(nameable)
    @nameable = nameable
    super()
  end

  # The Decorator delegates all work to the wrapped component.
  def correct_name
    @nameable.correct_name
  end
end
