require_relative './name_decorator'

# Create a class that inherits from the base Decorator class.
# Implement a method correct_name that capitalizes the output of @nameable.correct_name
class CapitalizeName < NameDecorator
  def correct_name
    nameable.correct_name.capitalize
  end
end
