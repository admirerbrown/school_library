#!/usr/bin/env ruby

require_relative './app'

def make_person
  puts 'Do you want to create a student (1) or teacher (2)? [Input the number]:'
  new_res = gets.chomp.to_i
  case new_res
  when 1
    create_student
  when 2
    create_teacher
  end
end

def director(user_answer)
  case user_answer
  when 1
    all_books
  when 2
    all_people
  when 3
    make_person
  when 4
    create_book
  when 5
    create_rental
  when 6
    user_rentals
  end
end

def main
  loop do
    puts ' '
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    user_answer = gets.chomp.to_i
    break if user_answer == 7

    director(user_answer)
  end
end

main
