require 'date'
require_relative 'game_file'

class GameCollection
  def initialize(games = [])
    @games = games
  end

  def print
    @games.each_with_index do |game, index|
      multiplayer = game.multiplayer ? 'Multiplayer' : 'Singleplayer'
      puts "#{index + 1}. #{multiplayer} #{game.last_played_at}"
    end
    puts
  end

  def add(game)
    @games << game unless @games.include? game
  end

  def fetch
    game_file = GameFile.new

    game_file.read.each do |game|
      @games << Game.new(
        publish_date: game['publish_date'],
        archived: game['archived'],
        multiplayer: game['multiplayer'],
        last_played_at: Date.parse(game['last_played_at'])
      )
    end
  end

  def save
    game_file = GameFile.new
    game_file.save @games
  end
end
