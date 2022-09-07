require 'json'
require 'date'
require_relative 'item'
require_relative 'game_collection'

class Game < Item
  alias can_be_archived_parent? can_be_archived?
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date:, archived:, multiplayer:, last_played_at:)
    id = Random.rand(1..1000)
    super(id, publish_date, archived)

    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def as_json(_options = {})
    {
      id: @id,
      publish_date: @publish_date,
      archived: @archived,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end

  private

  def can_be_archived?
    now_date = Date.today
    last_played_at_date = @last_played_at
    diff_days = now_date - last_played_at_date

    can_be_archived_parent? && diff_days.to_i > (365 * 2) # 2 years
  end
end
