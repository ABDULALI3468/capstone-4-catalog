require_relative 'attribute'

class Label < Attribute
  attr_accessor :title, :color

  def initialize(title, color, id = rand(1..100))
    super(id)
    @title = title
    @color = color
  end

  def as_hash
    {
      id: @id,
      title: @title,
      color: @color
    }
  end
end
