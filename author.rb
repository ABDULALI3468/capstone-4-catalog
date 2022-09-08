require_relative 'attribute'

class Author < Attribute
  attr_accessor :first_name, :last_name

  def initialize(first_name:, last_name:, id: number)
    super(id)
    @first_name = first_name
    @last_name = last_name
  end

  def as_json
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name
    }
  end

  def as_str
    "#[<{self.class}> id: #{@id}, full_name: #{@first_name} #{@last_name}]"
  end
end
