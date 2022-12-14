require_relative 'cli'
require_relative 'collections/collectors'

class App
  def initialize
    @collections = {
      games: GamesCollection.new(self),
      genres: GenresCollection.new(self),
      authors: AuthorsCollection.new(self),
      sources: SourcesCollection.new(self),
      labels: LabelsCollection.new(self),
      albums: AlbumsCollection.new(self),
      books: BooksCollection.new(self)
    }
    @cli = Cli.new

    fetch_collectors
  end

  def quit
    @collections.each { |_, collection| collection.save }
  end

  def collector(name)
    @collections[name].items
  end

  def print_main_menu
    @cli.print_main_menu
  end

  def process_listing(route)
    case route
    when 1
      @collections[:books].print
    when 2
      @collections[:albums].print
    when 3
      @collections[:games].print
    when 4
      @collections[:genres].print
    when 5
      @collections[:labels].print
    when 6
      @collections[:authors].print
    else
      @collections[:sources].print
    end
  end

  def process_creating(user_choice)
    case user_choice
    when 8
      create_book
    when 9
      create_album
    when 10
      create_game
    else
      create_genre
    end
  end

  private

  def parse_date(date_str)
    Date.parse(date_str)
  rescue StandardError
    Date.today
  end

  def create_game
    multiplayer = %w[y Y].include? @cli.read_input('Multiplayer [Y/N]')
    last_played_at = @cli.read_input('Last played date (YYYY-MM-DD)')

    game = Game.new(
      publish_date: Date.today,
      archived: true,
      multiplayer: multiplayer,
      last_played_at: parse_date(last_played_at)
    )

    @collections[:games].add(game)

    puts 'Game created successfully!'
  end

  def create_album
    publish_date = @cli.read_input('publish_date')
    on_spotify = yes_or_no?('Is it available on spotify?')
    archived = yes_or_no?('Is it archived?')

    album = MusicAlbum.new(
      publish_date: parse_date(publish_date),
      on_spotify: on_spotify,
      archived: archived
    )
    @collections[:albums].add(album)
    add_genre_to_album(album)

    puts('MusicAlbum created successfully!')
  end

  def create_genre
    name = @cli.read_input('name')
    @collections[:genres].add(Genre.new(name: name))
    puts('Genre created successfully!')
  end

  def add_genre_to_album(album)
    return unless yes_or_no?('Do you want to set genre?')

    @collections[:genres].print
    return if @collections[:genres].empty?

    index = @cli.read_menu_input(1..@collections[:genres].size)
    album.genre = @collections[:genres].items[index - 1]

    puts('A genre successfully set!')
  end

  def create_book
    publisher = @cli.read_input('Who is the Publisher')
    cover_state = @cli.read_input('What is the cover state')
    published_date = @cli.read_input('When the book was published')

    book = Book.new(
      publisher: publisher,
      cover_state: cover_state,
      publish_date: parse_date(published_date)
    )

    @collections[:books].add(book)

    print 'Book created successfully!'
  end

  def yes_or_no?(exp)
    puts(exp)
    %w[NO YES].each.with_index { |i, j| puts("#{j}. #{i}") }
    @cli.read_menu_input(0..1) == 1
  end

  def fetch_collectors
    @collections.each { |_, collection| collection.fetch }
  end
end
