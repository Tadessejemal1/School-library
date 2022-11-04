require_relative './book'
require_relative './person'

class Rental
  attr_accessor :date, :book, :person

  def initialize(book, person, date = Time.now)
    @date = date

    @book = book
    book.rentals.push(self)

    @person = person
    person.rentals.push(self)
  end

  def show_rental
    "#{@person.name} #{@book.title}  #{date}"
  end
end
