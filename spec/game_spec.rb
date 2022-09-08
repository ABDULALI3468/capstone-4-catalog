require 'json'
require 'date'
require_relative '../game'
require_relative '../collections/game_collection'

describe Game do
  before :each do
    @game = Game.new(publish_date: Date.today, archived: true, multiplayer: true, last_played_at: Date.today)
  end

  it 'Should convert to json' do
    json = {
      id: @game.id,
      publish_date: @game.publish_date,
      archived: @game.archived,
      multiplayer: @game.multiplayer,
      last_played_at: @game.last_played_at
    }

    expect(JSON.generate(@game)).to eq(JSON.generate(json))
  end

  describe 'can_be_archived? method' do
    it 'Should return true when same method in the parent returns true and the last_played_at is > 2 years' do
      test_date = Date.today - ((365 * 2) + 10)
      game = Game.new(publish_date: Date.today, archived: true, multiplayer: true, last_played_at: test_date)

      expect(game.send(:can_be_archived?)).to be(true)

      test_date = Date.today + 10
      game = Game.new(publish_date: Date.today, archived: true, multiplayer: true, last_played_at: test_date)

      expect(game.send(:can_be_archived?)).to be(false)
    end
  end
end
