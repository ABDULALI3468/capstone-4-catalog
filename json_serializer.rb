require 'json'
require_relative 'genre'
require_relative 'music_album'

module JSONSerializer
  def path(filename)
    "Data/#{filename}.json"
  end

  def read_files
    read_genres
    read_albums
  end

  def save_files
    save_genres
    save_albums
  end

  def as_json(filename, data = {})
    File.write(path(filename), data.to_json)
  end

  def from_json(filename)
    return unless File.exist?(path(filename))

    JSON.parse(File.read(path(filename)))
  end

  def save_genres
    as_json('genres', @genres.map(&:as_hash))
  end

  def save_albums
    as_json('music_albums', @music_albums.map(&:as_hash))
  end

  def read_genres
    genres = from_json('genres')
    return if genres.nil?

    genres.each do |obj|
      @genres << Genre.new(obj['name'], obj['id'])
    end
  end

  def read_albums
    albums = from_json('music_albums')
    return if albums.nil?

    albums.each do |obj|
      album = MusicAlbum.new(
        obj['publish_date'], obj['on_spotify'], obj['id'],
        archived: obj['archived']
      )

      album.genre = @genres.find { |g| g.id == obj['genre'] }
      album.author = @authors.find { |a| a.id == obj['author'] }
      album.source = @sources.find { |s| s.id == obj['source'] }

      @music_albums << album
    end
  end
end
