require 'json'
module DataStore
  def write_books(publisher, cover_state, publish_date, books)
    books.push({ publisher: publisher, cover_state: cover_state, published_date: publish_date })
    File.write('./Data/books.json', JSON.pretty_generate(books), mode: 'w')
  end

  def load(path)
    if File.exist?(path)
      JSON.parse(File.read(path))
    else
      []
    end
  end
end
