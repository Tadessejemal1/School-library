class Person
  attr_reader :id, :parent_permission
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1...10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
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

person1 = Person.new(23, 'Tadesse')
person2 = Person.new(16, 'Dawit', false)

puts "person1: #{person1.can_use_services?}"
puts "person2: #{person2.can_use_services?}"
