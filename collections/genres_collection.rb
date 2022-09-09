require_relative 'base_collection'
require_relative '../genre'

class GenresCollection < BaseCollection
  def initialize(app)
    super(app, 'genres')
  end

  private

  def from_json(items)
    items.each do |item|
      @items << Genre.new(id: item['id'], name: item['name'])
    end
  end
end
