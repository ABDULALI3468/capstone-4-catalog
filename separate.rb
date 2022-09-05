class Item
  attr_writer :id, :archieved
  attr_reader :id, :genre, :author, :source, :label, :publish_date, :archieved

  def initialize(id, genre, author, source, label, publish_date, archieved)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archieved = archieved
  end

  def genre=(genre)
    @genre = genre
  end

  def author=(author)
    @author = author
  end

  def source=(source)
    @source = source
  end

  def label=(label)
    @label = label
  end

  def publish_date=(publish_date)
    @publish_date = publish_date
  end

  def can_be_archived?
    @publish_date > 10 ? true : false
  end

  def move_to_archive()
    @archieved = true if can_be_archived?
  end
end

# just for verification😎
item = Item.new(1,2,3,4,5,12,6)

puts item.can_be_archived?
puts item.move_to_archive
puts item.archieved
