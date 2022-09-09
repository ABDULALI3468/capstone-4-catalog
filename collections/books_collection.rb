require 'time'
require_relative 'base_collection'
require_relative '../book'

class BooksCollection < BaseCollection
  def initialize(app)
    super(app, 'books')
  end

  def from_json(items)
    items.each do |item|
      book = Book.new(
        id: item['id'],
        cover_state: item['cover_state'],
        publisher: item['publisher'],
        archived: item['archived'],
        publish_date: Date.parse(item['publish_date'])
      )
      restore_relationship(book, item)
    end
  end
end
