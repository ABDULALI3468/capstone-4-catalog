require 'json'
require 'date'
require_relative 'rspec_helper'

describe Author do
  before :each do
    @author = Author.new(first_name: 'hakim', last_name: 'bhd')
  end

  describe 'add_item method' do
    before :each do
      @item = Item.new(Date.parse('2020-11-11'))
      @size = @author.items.size

      @author.add_item @item
    end

    it 'Should push an item to items' do
      expect(@author.items.size).to be(@size + 1)
    end

    it 'Should not push when the item exists' do
      @author.add_item @item

      expect(@author.items.size).to be(@size + 1)
    end

    it 'Should convert to json' do
      json = {
        id: @author.id,
        first_name: @author.first_name,
        last_name: @author.last_name
      }

      expect(JSON.generate(@author)).to eq(JSON.generate(json))
    end
  end
end
