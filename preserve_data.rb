require 'json'

module PreserveData
  def create_file(path)
    FileUtils.mkdir_p('data')

    File.open(path, 'w') do |file|
      file.puts JSON.generate([])
    end
  end

  def fetch_data(path)
    JSON.parse(File.read(path), create_additions: true)
  end

  def save(path, data)
    File.write(path, JSON.generate(data, create_additions: true))
  end

  def file_exist?(filename)
    File.exist? filename
  end

  def fetch_people
    path = 'json/person.json'

    if file_exist?(path)
      fetch_data(path).map do |person|
        if person['instance'] == 'Teacher'
          Teacher.new(id: person['id'], specialization: person['specialization'],
                      age: person['age'], name: person['name'])
        else
          parent_permission = person['permission'] && true
          Student.new(id: person['id'], age: person['age'], name: person['name'],
                      parent_permission: parent_permission, classroom: person['classroom'])
        end
      end
    else
      create_file(path)
      []
    end
  end

  def fetch_books
    path = 'json/book.json'

    if file_exist?(path)
      fetch_data(path).map do |book|
        Book.new(book['title'], book['author'])
      end
    else
      create_file(path)
      []
    end
  end

  def fetch_rentals
    path = 'json/rental.json'

    if file_exist?(path)
      fetch_data(path).map do |rental|
        date = rental['date']
        select_person = people.select { |person| person.id == rental['id'] }
        select_book = books.select { |book| book.title == rental['title'] }

        Rental.new(select_person[0], select_book[0], date)
      end
    else
      create_file(path)
      []
    end
  end

  def save_person(person)
    path = 'json/person.json'
    data = fetch_data(path)

    if person.instance_of?(Teacher)
      data.push({ instance: 'Teacher', id: person.id, age: person.age, name: person.name,
                  specialization: person.specialization })
    else
      data.push({ instance: 'Student', id: person.id, age: person.age, name: person.name,
                  permission: person.parent_permission, classroom: person.classroom })
    end

    save(path, data)
  end

  def save_book(book)
    path = 'json/book.json'
    data = fetch_data(path)

    data.push({ title: book.title, author: book.author })
    save(path, data)
  end

  def save_rental(rental)
    path = 'json/rental.json'
    data = fetch_data(path)

    data.push({ date: rental.date, id: rental.person.id, title: rental.book.title })
    save(path, data)
  end
end
