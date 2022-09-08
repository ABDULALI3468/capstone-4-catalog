require_relative 'rand_number'

class Item
  attr_accessor :publish_date, :publish_date
  attr_reader :id, :archived, :genre, :author, :source, :label

  include RandNumber

  def initialize(publish_date, archived, id = rand(1..1000))
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def as_hash
    {
      id: @id,
      genre: @genre ? @genre.id : nil,
      author: @author ? @author.id : nil,
      source: @source ? @source.id : nil,
      publish_date: @publish_date,
      archived: @archived
    }
  end

  # @param genre [Genre]
  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.nil? || genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items << self unless author.nil? || author.items.include?(self)
  end

  def source=(source)
    @source = source
    source.items << self unless source.nil? || source.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items << self unless label.nil? || label.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    # :TODO:
    #   - decide on :publish_date actual data form
    @publish_date > 10
  end
end
