require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date:, on_spotify:, id: number, archived: false)
    super(publish_date, id, archived: archived)
    @on_spotify = on_spotify
  end

  def as_json
    {
      **super,
      on_spotify: @on_spotify
    }
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
