require_relative './nameable'
require_relative './rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals, :parent_permission

  def initialize(id:, age:, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    @parent_permission && of_age?
  end

  def validate_name
    @corrector.correct_name(@name)
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
