require_relative './name_decorator'

# Create a class that inherits from the base Decorator class.
# Implement a method correct_name that makes sure that the output of @nameable
# correct_name has a maximum of 10 characters.
class TrimmerDecorator < NameDecorator
  def correct_name
    nameable.correct_name[0, 10]
  end
end
