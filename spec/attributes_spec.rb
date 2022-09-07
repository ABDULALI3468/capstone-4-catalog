require_relative 'rspec_helper'

describe Attribute do
  it ':add_item on Genre' do
    album = MusicAlbum.new(10, false)
    genre = Genre.new(:HIP_HOP)
    genre.add_item(album)
    expect(album.genre).to be(genre)
  end

  it ':add_item on Source' do
    album = MusicAlbum.new(10, false)
    source = Source.new(:EURO)
    source.add_item(album)
    expect(album.source).to be(source)
  end

  it ':name & :add_item on Author' do
    album = MusicAlbum.new(10, false)
    author = Author.new('Henry', 'Morse')
    author.add_item(album)
    expect(album.author).to be(author)
    expect(author.name).to eq('Henry Morse')
  end

  it ':add_item on label' do
    album = MusicAlbum.new(10, false)
    label = Label.new(:SONY, :RED)
    label.add_item(album)
    expect(album.label).to be(label)
  end
end
