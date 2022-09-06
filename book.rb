require_relative 'item'

class Book < Item

  attr_accessor :publish, :cover_state

  def initialize(archieved, publish, cover_state, publish_date)

    super(publish_date, archieved)

    @publish = publish
    @cover_state = cover_state
  end

  private

  def can_be_archived?()
    can_be_archived? || @cover_state == 'bad' ? true : false
  end
end

