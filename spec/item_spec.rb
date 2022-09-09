require 'date'
require_relative '../item'
require_relative '../author'

describe 'Item' do
  before :each do
    @item = Item.new(Date.parse('2020-11-11'))
  end

  context 'Checks the Item class working smoothly' do
    it 'Checks for Instance of ITEM' do
      expect(@item).to be_instance_of Item
    end

    it 'Checks for Published date' do
      expect(@item.publish_date).to eq Date.parse('2020/11/11')
    end

    it 'Checks for archived' do
      expect(@item.archived).to eq false
    end

    it 'Checks for author SETTER' do
      author = Author.new(first_name: 'ALI', last_name: 'ABDUL')
      @item.author = author
      expect(@item.author.first_name).to eq 'ALI'
      expect(@item.author.last_name).to eq 'ABDUL'
    end
  end
end
