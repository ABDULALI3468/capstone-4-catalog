require 'time'
require_relative 'rand_number'

class Item
  attr_accessor :publish_date
  attr_reader :id, :archived, :genre, :author, :source, :label

  include RandNumber

  def initialize(publish_date, id = number, archived: false)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def as_str
    "#[<{self.class}> id: #{@id}, publish_date: #{@publish_date}]"
  end

  def as_json
    {
      id: @id,
      label: @label ? @label.id : nil,
      genre: @genre ? @genre.id : nil,
      author: @author ? @author.id : nil,
      source: @source ? @source.id : nil,
      publish_date: @publish_date,
      archived: @archived
    }
  end

  def to_json(*options)
    as_json.to_json(*options)
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
    (Date.today - @publish_date) / 365 > 10
  end
end
