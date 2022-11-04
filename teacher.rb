require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'Unknown')
    @specialization = specialization
    super(age, name)
  end

  def can_use_services?
    true
  end
end
