require_relative 'base_collection'
require_relative '../source'

class SourcesCollection < BaseCollection
  def initialize(app)
    super(app, 'sources')
  end

  private

  def from_json(items)
    items.each do |item|
      @items << Source.new(id: item['id'], name: item['name'])
    end
  end
end
