# many to many relationship
# we create class rental

class Rental
  attr_accessor :date

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
