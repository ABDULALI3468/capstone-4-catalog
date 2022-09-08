require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(archived: false, publisher:, id: number, cover_state:, publish_date:)
    super(publish_date, id, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def as_json
    {
      **super,
      publisher: @publisher,
      cover_state: @cover_state
    }
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
