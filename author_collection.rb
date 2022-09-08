require_relative 'author_file'

class AuthorCollection
  def initialize(authors = [])
    @authors = authors
  end

  def print
    @authors.each do |author, index|
      puts "#{index + 1}. #{author.first_name} #{author.last_name}"
    end
    puts
  end

  def add(author)
    @authors << author unless @authors.include? author
  end

  def fetch
    author_file = AuthorFile.new

    author_file.read.each do |author|
      @authors << Author.new(
        id: author['id'],
        first_name: author['first_name'],
        last_name: author['last_name']
      )
    end
  end

  def save
    author_file = AuthorFile.new
    author_file.save @authors
  end
end
