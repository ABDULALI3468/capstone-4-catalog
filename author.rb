require_relative 'author_collection'

class Author
  attr_reader :id, :items
  attr_accessor :first_name, :last_name

  def initialize(first_name:, last_name:, id: Random.rand(1..1000), items: [])
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = items
  end

  def add_item(item)
    item.author = self unless item.author == self
    @items << item unless @items.include? item
  end

  def as_json(_options = {})
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name
      # TODO: add this when item can be converted to json
      # items: -> { JSON.generate @items }
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end

  def save
    create_dir(file_path) unless File.exist?(file_path)
    File.write(file_path, JSON.pretty_generate(self))
  end

  def create_dir(_path)
    dirname = File.dirname(full_path)
    FileUtils.mkdir_p(dirname) unless File.directory?(dirname)
    File.new(full_path, 'w')
  end
end
