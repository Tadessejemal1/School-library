require_relative './person'
require_relative './capitalize_name_decorator'
require_relative './trim_name_decorator'
require_relative './book'
require_relative './rental'
require_relative './student'

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeName.new(person)
capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
capitalized_trimmed_person.correct_name

puts capitalized_trimmed_person.correct_name
puts capitalized_person.correct_name

student1 = Person.new(15, 'Bob')
student2 = Person.new(17, 'Mary')

book1 = Book.new('Book1 Title', 'Book1 Author')
book2 = Book.new('Book2 Title', 'Book2 Author')

rental1 = Rental.new(book1, student1)
rental2 = Rental.new(book2, student2)

puts "Total books rented by #{student1.name} = #{student1.rentals.length}"
puts rental1.show_rental, rental2.show_rental
