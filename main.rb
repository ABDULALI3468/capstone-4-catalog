require 'date'
require_relative 'app'
require_relative 'cli'
require_relative 'game'
require_relative 'game_collection'
require_relative 'author_collection'

CLI = Cli.new
GAME_COLLECTION = GameCollection.new
AUTHOR_COLLECTION = AuthorCollection.new

def main
  app = App.new

  loop do
    choice = app.print_main_menu
    case choice
    when 1
      puts 'Listing all books'
      CLI.list_books
    when 2
      puts 'Getting items by ID'
    when 4
      GAME_COLLECTION.print
    when 5
      AUTHOR_COLLECTION.print
    when 6
      create_game
      puts 'List all labels'
      CLI.list_labels
    when 3
      puts 'Add a book'
      CLI.create_book
    when 4
      app.list_all_albums
    when 5
      app.list_all_genres
    when 6
      app.create_music_album
    when 7
      app.create_genre
    else
      GAME_COLLECTION.save
      AUTHOR_COLLECTION.save

      puts 'App quitting gracefully..'
      break
    end
  end
  app.quit
end

def create_game
  multiplayer = %w[y Y].include? CLI.read_input('Multiplayer [Y/N]')
  last_played_at = CLI.read_input('Last played date (YYYY-MM-DD)')

  begin
    last_played_at = Date.parse last_played_at
  rescue StandardError
    last_played_at = Date.today
  end

  game = Game.new(
    publish_date: Date.today,
    archived: true,
    multiplayer: multiplayer,
    last_played_at: last_played_at
  )

  GAME_COLLECTION.add game

  puts 'Game created successfully!'
end

main
