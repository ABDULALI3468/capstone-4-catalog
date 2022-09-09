require_relative 'base_collection'
require_relative '../author'

class AuthorsCollection < BaseCollection
  def initialize(app)
    super(app, 'authors')
  end

  private

  def from_json(items)
    items.each do |item|
      @items << Author.new(
        id: item['id'],
        first_name: item['first_name'],
        last_name: item['last_name']
      )
    end
  end
end
