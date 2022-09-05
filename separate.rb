class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id, :archieved

  def initialize(id, publish_date, archieved)
    @id = id
    # @genre = genre
    # @author = author
    # @source = source
    # @label = label
    @publish_date = publish_date
    @archieved = archieved
  end

  def move_to_archive()
    @archieved = true if can_be_archived?
  end

  private

  def can_be_archived?
    # TODO: to  be figured out
    @publish_date > 10
  end
end

# just for verification😎``
item = Item.new(1, 22, 11)

puts item.move_to_archive
puts item.archieved
