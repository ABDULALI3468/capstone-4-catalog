require 'date'
require_relative 'rspec_helper'

describe Attribute do
  before do
    @album = MusicAlbum.new(publish_date: Date.parse('2011/08/11'), on_spotify: false)
  end

  it ':add_item on Genre' do
    genre = Genre.new(name: :HIP_HOP)
    genre.add_item(@album)
    expect(@album.genre).to be(genre)
  end

  it ':add_item on Source' do
    source = Source.new(name: :EURO)
    source.add_item(@album)
    expect(@album.source).to be(source)
  end

  it ':name & :add_item on Author' do
    author = Author.new(first_name: 'Henry', last_name: 'Morse')
    author.add_item(@album)
    expect(@album.author).to be(author)
  end

  it ':add_item on label' do
    label = Label.new(title: :SONY, color: :RED)
    label.add_item(@album)
    expect(@album.label).to be(label)
  end
end
