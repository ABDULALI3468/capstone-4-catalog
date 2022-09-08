require_relative 'rspec_helper'

describe 'MusicAlbum' do
  before do
    @create_album = -> (date, on_spotify) {
      MusicAlbum(publish_date: Date.parse(date), on_spotify: on_spotify)
    }
  end

  context 'can_be_archived? evaluates to `TRUE`' do
    it 'with :on_spotify=true && :publish_date > 10_years' do
      album = MusicAlbum.new(11, true)
      album.move_to_archive
      expect(album.archived).to be_truthy
    end
  end

  context 'can_be_archived? evaluates to `FALSE`' do
    it 'with :on_spotify=true_&_:publish_date<=10 ' do
      album = MusicAlbum.new(9, true)
      album.move_to_archive
      expect(album.archived).to be_falsey
    end

    it 'with :on_spotify=false_&_:publish_date>10 ' do
      album = MusicAlbum.new(11, false)
      album.move_to_archive
      expect(album.archived).to be_falsey
    end
  end

  context 'set :genre' do
    it 'through self setter method :genre=(obj)' do
      album = MusicAlbum.new(10, false)
      genre = Genre.new(:HIP_HOP)
      album.genre = genre
      expect(genre.items.include?(album)).to be_truthy
    end

    it 'through self setter method :genre=(nil)' do
      album = MusicAlbum.new(10, false)
      album.genre = nil
      expect(album.genre.nil?).to be_truthy
    end
  end
end
