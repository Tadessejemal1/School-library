require_relative './nameable'
require_relative './rental'

class Person < Nameable
  attr_reader :id, :parent_permission
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1...10_000).to_i
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(book, self, date)
  end

  private

  def of_age?
    return true if age >= 18

    false
  end

  public

  def can_use_services?
    return true if of_age? || parent_permission

    false
  end
end
