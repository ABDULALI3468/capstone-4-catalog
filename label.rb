require_relative 'attribute'

class Label < Attribute
  attr_accessor :title, :color

  def initialize(title:, color:, id: number)
    super(id)
    @title = title
    @color = color
  end

  def as_json
    { id: @id, title: @title, color: @color }
  end

  def as_str
    "[<#{self.class}> id: #{@id}, title: #{@title}, color: #{@color}]"
  end
end
