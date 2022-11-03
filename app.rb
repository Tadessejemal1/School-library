require_relative './book'
require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './capitalize_name_decorator'
require_relative './trim_name_decorator'

class App
  attr_reader :books, :people

  def initialize()
    @books = []
    @people = []
    @rentals = []
  end

  ## Create a person (teacher or student, not a plain Person).
  def register_person(role, name, age, specialization = '', parent_permission = '')
    puts 'method called'
    is_permitted = parent_permission.downcase == 'y'
    person = if role == 1
               Student.new('104', age, name, parent_permission: is_permitted)
             else
               Teacher.new(specialization, age, name)
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
    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date} Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end
end