require_relative 'item'

class Label < Item

  attr_reader :items, :title, :color

  def initialize(title, color, publish_date, archieved)
    super(publish_date, archieved)
    @id = rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

end
