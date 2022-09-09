require_relative 'base_collection'
require_relative '../label'

class LabelsCollection < BaseCollection
  def initialize(app)
    super(app, 'labels')
  end

  private

  def from_json(items)
    items.each do |item|
      @items << Label.new(id: item['id'], title: item['title'], color: item['color'])
    end
  end
end
