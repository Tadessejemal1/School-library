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
  puts ''
  puts 'Please choose an option by entering a number: '
  options.each_with_index do |option, index|
    puts "#{index + 1} - #{option.capitalize}"
  end
  gets.chomp.to_i
end

def create_a_person(app)
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    selected = gets.chomp
    selected = selected.to_i
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    age = age.to_i
    print 'Has parent permission? [Y/N]: ' if selected == 1
    permission = gets.chomp if selected == 1
    permission = true if %w[y Y].include?(permission)
    permission = false if %w[n N].include?(permission)
  
    print 'Specialization: ' if selected == 2
    speciality = gets.chomp if selected == 2
  
    @people.push(Student.new(age, name, parent_permission: permission)) if selected == 1
    @people.push(Teacher.new(age, speciality, name)) if selected == 2
  
    puts 'Person created succesfully!'
end

def create_new_book(app)
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
  when 3 then create_a_person(app)
  when 4 then create_new_book(app)
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