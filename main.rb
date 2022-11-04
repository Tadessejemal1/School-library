require_relative './person'
require_relative './book'
require_relative './app'

def selected_option_number
  options = [
    'list all books',
    'list all people',
    'create a person',
    'create a book',
    'create a rental',
    'list all rentals for a give person id',
    'exit'
  ]
  puts
  puts 'Please choose an option by entering a number: '
  options.each_with_index do |option, index|
    puts "#{index + 1} - #{option.capitalize}"
  end
  gets.chomp.to_i
end

def add_person(app)
  puts 'Do you want to register a student (1) or a teacher (2)? [1 - student, 2 - teacher]'
  role = gets.chomp.to_i
  print 'Name: '
  name = gets.chomp
  print 'Age: '
  age = gets.chomp
  if role == 1
    print 'Has parent permission? [Y|N]: '
    parent_permission = gets.chomp
  else
    print 'Specialization: '
    specialization = gets.chomp
  end
  app.register_person(role, name, age, parent_permission || specialization)
  puts 'Person successfully registered!'
end

def add_new_book(app)
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  app.create_book(title, author)
  puts 'Book successfully created!'
end

def register_new_rental(app)
  puts 'Select a book from the following list by its number'
  app.books.each_with_index { |book, index| puts "(#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
  selected_book_number = gets.chomp.to_i
  puts 'Select a person from the following list by its number'
  app.people.each_with_index do |person, index|
    puts " (#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
  selected_person_number = gets.chomp.to_i
  print 'Date: '
  book = app.books[selected_book_number]
  person = app.people[selected_person_number]
  date = gets.chomp
  app.create_rental(book, person, date)
end

def display_rentals_by_person(app)
  print 'ID of person: '
  person_id = gets.chomp.to_i
  puts 'Rentals:'
  app.list_rentals_by_person(person_id)
end

def case_when(app, selected_option)
  case selected_option
  when 1 then app.show_books
  when 2 then app.show_people
  when 3 then add_person(app)
  when 4 then add_new_book(app)
  when 5 then register_new_rental(app)
  when 6 then display_rentals_by_person(app)
  else
    puts 'Please select a valid number from the list!'
  end
end

def main
  app = App.new

  puts 'Welcome to School Library App!'
  loop do
    selected_option = selected_option_number
    break if selected_option == 7

    case_when app, selected_option
  end
end

main
