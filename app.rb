require_relative './book'
require_relative './person'
require_relative './classroom'
require_relative './student'
require_relative './teacher'
require_relative './rental'

def all_books
  booklist = Book.saved_books
  if booklist.empty?
    puts 'Empty No books! please add a book'
  else
    booklist.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end
end

def create_book
  puts 'Title:'
  title = gets.chomp
  puts 'Author:'
  author = gets.chomp
  book = Book.new(title, author)
  Book.saved_books.push(book)
  puts 'Book created successfully'
end

# create student block here....
def resume(age, name, parent_permission, classroom_type)
  case parent_permission.upcase
  when 'Y'
    parent_permission = true
  when 'N'
    parent_permission = false
  end

  classroom = Classroom.new(classroom_type)
  person = Person.new(age, name, parent_permission: parent_permission)
  student = Student.new(person, classroom)
  Classroom.students.push(student)
  puts 'Student created successfully'
end

def create_student
  age = nil
  name = nil
  parent_permission = nil
  classroom_type = nil

  loop do
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission? [Y/N]:'
    parent_permission = gets.chomp
    puts 'classroom type eg.Math class:'
    classroom_type = gets.chomp

    break unless age.empty? || name.empty? || parent_permission.empty? || classroom_type.empty?

    puts 'Please enter a valid response for all fields'
  end

  resume(age, name, parent_permission, classroom_type)
end

# create a teacher block .....
def create_teacher
  age = nil
  name = nil
  specialization = nil

  loop do
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp

    break unless age.empty? || name.empty? || specialization.empty?

    puts 'Please enter a valid value for all fields'
  end

  person = Person.new(age, name)
  new_teacher = Teacher.new(person, specialization)
  Teacher.teachers << new_teacher
  puts 'Teacher created successfully'
end

# list all people block...
def retrieve_teachers
  teachers = Teacher.teachers
  puts '' if teachers.empty?
  teachers
end

def retrieve_students
  students = Classroom.students
  puts '' if students.empty?
  students
end

def all_people
  people = []
  all_teachers = retrieve_teachers
  all_students = retrieve_students

  all_teachers.each do |teacher|
    teacher_str = "[Teacher] Name: #{teacher.name}, Age: #{teacher.age}, Id: #{teacher.id}"
    people << { str: teacher_str, obj: teacher }
  end

  all_students.each do |student|
    student_str = "[Student] Name: #{student.name}, Age: #{student.age}, Id: #{student.id}"
    people << { str: student_str, obj: student }
  end

  if people.empty?
    puts 'Empty: Please create a person.'
  else
    people.each do |human|
      puts human[:str]
    end
  end
  people
end

# create rental block...
def create_rental
  book_list = Book.saved_books
  persons = all_people
  if book_list.empty?
    puts 'No books! please add a book'
  elsif persons.empty?
    puts 'puts please go back and create a person to rent the book'
  else
    puts 'Select a book from the following list by number'

    book_list.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_num = gets.chomp.to_i

    add_rentee(book_list, persons, book_num)
  end
end

def add_rentee(book_list, persons, book_num)
  rented_book = book_list[book_num]

  puts 'Select a person from the following list by number (not id)'
  persons.each_with_index do |person, index|
    puts "#{index}) #{person[:str]}"
  end

  rentee = gets.chomp.to_i
  receiver = persons[rentee][:obj]
  puts receiver

  puts 'Date:'
  date_rented = gets.chomp

  Rental.new(date_rented, receiver, rented_book)
  puts 'Rental created successfully'
end


