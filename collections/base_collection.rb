require_relative '../storage'

class BaseCollection
  attr_reader :name, :items

  include Storage

  def initialize(app, name)
    @app = app
    @name = name
    @items = []
  end

  def add(item)
    @items << item unless @items.include?(item)
  end

  def print
    if @items.empty?
      puts 'No record found!'
      return
    end

    @items.each.with_index(1) do |item, index|
      puts("#{index}. #{item.as_str}")
    end
    puts
  end

  def empty?
    @items.empty?
  end

  def size
    @items.size
  end

  def fetch
    items = read
    return if items.nil?

    from_json(items)
  end

  private

  def restore_relationship(item, obj)
    @items << item
    item.genre = @app.collector(:genres).find { |g| g.id == obj['genre'] }
    item.label = @app.collector(:labels).find { |l| l.id == obj['label'] }
    item.author = @app.collector(:authors).find { |a| a.id == obj['author'] }
    item.source = @app.collector(:sources).find { |s| s.id == obj['source'] }
  end

  def from_json(items)
    raise NotImplementedError
  end
end
