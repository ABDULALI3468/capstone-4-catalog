require_relative 'item'

class Book < Item

  attr_accessor :publisher, :cover_state

  def initialize(publish, cover_state, publish_date)
    @publish = publish
    @cover_state = cover_state
    super(publish_date)
  end

  private

  def can_be_archived?()
    can_be_archived? || @cover_state == 'bad' ? true : false
  end
end

book = Book.new(1, 'bad')
puts book.can_be_archived?
