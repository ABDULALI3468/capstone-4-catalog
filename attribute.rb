require_relative 'rand_number'

class Attribute
  attr_reader :id, :items

  include RandNumber

  def initialize(id)
    @id = id
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.instance_variable_set("@#{self.class.name.downcase}", self)
  end

  def as_json
    raise NotImplementedError
  end

  def to_json(*options)
    as_json.to_json(*options)
  end
end

class NamedAttribute < Attribute
  attr_accessor :name

  def initialize(name:, id: number)
    super(id)
    @name = name
  end

  def as_json
    { id: @id, name: @name }
  end

  def as_str
    "[<#{self.class}> id: #{@id}, name: #{@name}]"
  end
end
