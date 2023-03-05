require_relative './person'

class Student < Person
  def initialize(class_room)
    super()
    @class_room = class_room
  end

  def play_hockey
    '¯(ツ)/¯'
  end
end
