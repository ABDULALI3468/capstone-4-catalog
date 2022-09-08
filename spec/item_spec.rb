require_relative '../item'

describe 'Item' do
  before :each do
    @item = Item.new('2020/11/11', false)
  end

  context 'Checks the Item class working smoothly' do
    it 'Checks for Instance of ITEM' do
      expect(@item).to be_instance_of Item
    end

    it 'Checks for Published date' do
      expect(@item.publish_date).to eq '2020/11/11'
    end

    it 'Checks for archived' do
      expect(@item.archived).to eq false
    end

    it 'Checks for author SETTER' do
      @item.author = 'ABDUL ALI'
      expect(@item.author).to eq 'ABDUL ALI'
    end
  end
end
