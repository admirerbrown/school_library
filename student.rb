require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(person, classroom)
    super(person)
    @classroom = classroom
  end

  def play_hockey
    '¯(ツ)/¯'
  end

  # custom setter method for the classroom attribute
  # accepts classroom object...
  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
