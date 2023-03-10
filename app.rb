require_relative './book'
require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './rental'

def all_books
  booklist = Book.saved_books
  if booklist.empty?
    puts 'No books! please add a book'
  else
    booklist.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end
end

def all_people
  Teachers.teachers
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

def resume(age, name, parent_permission)
  case parent_permission.upcase
  when 'Y'
    parent_permission = true
  when 'N'
    parent_permission = false
  end

  classroom = Classroom.new(classroom_type)
  person = Person.new(age, name, parent_permission: parent_permission)
  student = Student.new(person, classroom)
  classroom.add_student(student)
  puts 'Student created successfully'
end

def create_student
  age = nil
  name = nil
  parent_permission = nil

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

  resume(age)
end

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

def create_rental
  puts 'Select a book form the following list by number'
  all_books
  selected_book = gets.chomp
  puts 'Select a person from the following list by number(not id)'
end
