require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date:, archived:, multiplayer:, last_played_at:, id: number)
    super(publish_date, id, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def as_json
    {
      **super,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at
    }
  end

  def as_str
    playing_style = @multiplayer ? 'Multiplayer' : 'Singleplayer'
    "[<#{self.class}> #{playing_style} #{@last_played_at}]"
  end

  private

  def can_be_archived?
    now_date = Date.today
    last_played_at_date = @last_played_at
    diff_days = now_date - last_played_at_date

    super && diff_days.to_i > (365 * 2)
  end
end
