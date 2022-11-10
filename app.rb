require_relative './book'
require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './capitalize_name_decorator'
require_relative './trim_name_decorator'
require_relative './preserve_data'

class App
  include PreserveData
  attr_reader :books, :people, :rentals

  def initialize
    @people = fetch_people
    @books = fetch_books
    @rentals = fetch_rentals
  end

  ## Create a person (teacher or student, not a plain Person).
  def register_person(role, name, age, specialization = '', parent_permission = '')
    puts 'method called'
    parent_permission = parent_permission.downcase == 'y'
    person = if role == 1
               Student.new(id: Random.rand(1..1000), age: age.to_i, name: name, parent_permission: parent_permission)
             else
               Teacher.new(id: Random.rand(1..1000), specialization: specialization, age: age.to_i, name: name)
             end
    @people << person
  end

  ## Create a book.
  def create_book(title, author)
    @books << Book.new(title, author)
  end

  ## List all people.
  def show_people
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  ## List all books.
  def show_books
    @books.each { |book| puts "[#{book.class}] Title: \"#{book.title}\", Author: #{book.author}" }
  end

  ## Create a rental.
  def create_rental(book, person, date)
    @rentals.push(Rental.new(book, person, date))
  end

  ## List all rentals for a given person id.
  def list_rentals_by_person(person_id)
    rentals.each do |rental|
      if rental.person.id == person_id
        puts "[#{rental.person.class}] Name: #{rental.person.name}
        | Date: #{rental.date} | Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end
end
