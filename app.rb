require_relative 'json_serializer'
require_relative 'cli'

class App
  attr_reader :music_albums, :genres

  include JSONSerializer

  def initialize
    @music_albums = []
    @genres = []
    @authors = []
    @sources = []
    @labels = []
    @cli = Cli.new

    read_files
  end

  def print_main_menu
    @cli.print_main_menu
  end

  def list_all_albums
    if @music_albums.empty?
      puts('No music-albums available')
    else
      puts('LIST OF MUSIC ALBUMS')
      puts('=' * 23)
      @music_albums.each.with_index(1) { |m, j| puts("#{j}. #{m.as_str}") }
    end
  end

  def list_all_genres
    if @genres.empty?
      puts('No genres available')
    else
      puts('LIST OF GENRES')
      puts('=' * 18)
      @genres.each.with_index(1) { |g, j| puts("#{j}. [name:<#{g.name}>]") }
    end
  end

  def create_music_album
    publish_date = @cli.read_input('publish_date')
    on_spotify = yes_or_no?('Is it available on spotify?')
    archived = yes_or_no?('Is it archived?')
    album = MusicAlbum.new(publish_date, on_spotify, archived: archived)
    @music_albums << album
    add_genre_to_album(album)
    puts('A music-album successfully created!')
  end

  def create_genre
    name = @cli.read_input('name')
    @genres << Genre.new(name)
    puts('Genre created successfully!')
  end

  def add_genre_to_album(album)
    return unless yes_or_no?('Do you want to set genre?')

    list_all_genres
    return if @genres.empty?

    index = @cli.read_menu_input(1..@genres.length)
    album.genre = @genres[index - 1]
    puts('A genre successfully set!')
  end

  def yes_or_no?(exp)
    puts(exp)
    %w[NO YES].each.with_index { |i, j| puts("#{j}. #{i}") }
    @cli.read_menu_input(0..1) == 1
  end

  def quit
    save_files
  end
end
