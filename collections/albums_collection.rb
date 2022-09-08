require 'time'
require_relative 'base_collection'
require_relative '../music_album'

class AlbumsCollection < BaseCollection
  def initialize(app)
    super(app, 'music_albums')
  end

  def from_json(items)
    items.each do |item|
      album = MusicAlbum.new(
        id: item['id'],
        on_spotify: item['on_spotify'],
        archived: item['archived'],
        publish_date: Date.parse(item['publish_date'])
      )
      restore_relationship(album, item)
    end
  end
end
