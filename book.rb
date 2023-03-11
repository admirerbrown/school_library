class Book
  attr_reader :rentals
  attr_accessor :title, :author

  @saved_books = []

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  class << self
    attr_reader :saved_books
  end
end
