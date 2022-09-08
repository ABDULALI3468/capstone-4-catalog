require_relative 'cli'
require_relative 'collections/collectors'

class App
  def initialize
    @collections = {
      :games => GamesCollection.new(self),
      :genres => GenresCollection.new(self),
      :authors => AuthorsCollection.new(self),
      :sources => SourcesCollection.new(self),
      :labels => LabelsCollection.new(self),
      :albums => AlbumsCollection.new(self)
    }
    @cli = Cli.new
  end

  def quit
    @collections.each { |_, collection| collection.save }
  end

  def collector(name)
    @collections[name]
  end

  def print_main_menu
    @cli.print_main_menu
  end

  def process_listing(user_choice)
    case user_choice
    when 1  # list books
      @collections[:books].print
    when 2
      @collections[:labels].print
      # =snip=
    else
      @collections[:authors].print
    end
  end

  def process_creating(user_choice)
    case user_choice
    when 8
      'create'
    else
      'create'
    end
  end

  private

  def parse_date(date_str)
    begin
      Date.parse(date_str)
    rescue StandardError
      Date.today
    end
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
    album.genre = @collections[:genres].pull(index - 1)

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
end
