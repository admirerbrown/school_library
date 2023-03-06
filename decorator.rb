require_relative './nameable'

class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    name_cap = @nameable.correct_name
    name_cap.upcase
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    output = name.slice(0, 10) if name.length > 10
    output
  end
end
