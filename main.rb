require 'date'
require_relative 'cli'
require_relative 'game'
require_relative 'game_collection'
require_relative 'author_collection'

CLI = Cli.new
GAME_COLLECTION = GameCollection.new
AUTHOR_COLLECTION = AuthorCollection.new

def main
  loop do
    choice = CLI.print_main_menu
    case choice
    when 1
      puts 'Listing all items'
    when 2
      puts 'Getting items by ID'
    when 4
      GAME_COLLECTION.print
    when 5
      AUTHOR_COLLECTION.print
    when 6
      create_game
    else
      GAME_COLLECTION.save
      AUTHOR_COLLECTION.save

      puts 'App quitting gracefully..'
      break
    end
  end
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
