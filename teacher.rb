require_relative './person'

class Teacher < Person
  @teachers = []

  def initialize(person, specialization)
    super(person)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  class << self
    attr_reader :teachers
  end
end
