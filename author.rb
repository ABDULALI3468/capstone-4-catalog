require_relative 'attribute'

class Author < Attribute
  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize(firstname, lastname, id = number)
    super(id)
    @first_name = firstname
    @last_name = lastname
  end

  def name
    "#{@first_name} #{last_name}"
  end

  def as_hash
    {
      id: @id,
      firstname: @first_name,
      lastname: @last_name
    }
  end
end
