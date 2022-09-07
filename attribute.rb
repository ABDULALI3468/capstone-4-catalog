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

  def as_hash
    raise NotImplementedError
  end

  def self.from_json(*args)
    new(*args)
  end
end

class NamedAttribute < Attribute
  attr_accessor :name

  def initialize(name, id = number)
    super(id)
    @name = name
  end

  def as_hash
    { id: @id, name: @name }
  end
end
