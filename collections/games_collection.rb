require 'date'
require_relative 'base_collection'
require_relative '../game'

class GamesCollection < BaseCollection
  def initialize(app)
    super(app, 'games')
  end

  def from_json(items)
    items.each do |item|
      game = Game.new(
        id: item['id'],
        archived: item['archived'],
        multiplayer: item['multiplayer'],
        publish_date: Date.parse(item['publish_date']),
        last_played_at: Date.parse(item['last_played_at'])
      )
      restore_relationship(game, item)
    end
  end
end
