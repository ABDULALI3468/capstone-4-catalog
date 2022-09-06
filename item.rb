class Item
  attr_reader :id, :genre, :author, :source, :label, :publish_date, :archieved

  def initialize(publish_date, archieved)
    @id = rand(1..1000)
    # @genre = genre
    # @author = author
    # @source = source
    # @label = label
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

  def move_to_archive()
    @archieved = true if can_be_archived?
  end

  private

  def can_be_archived?
    # todo : to  be figured out
    @publish_date > 10
  end
end

