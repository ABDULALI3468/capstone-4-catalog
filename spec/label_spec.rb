require_relative '../label'
require_relative '../item'

describe 'Label' do
  before :each do
    @label = Label.new('Gift', 'Red', '2020/11/11', false)
  end

  context 'Check the Label class working smoothly' do
    it 'Checks for Instance' do
      expect(@label).to be_instance_of Label
    end

    it 'Checks for Title' do
      expect(@label.title).to eq 'Gift'
    end

    it 'Checks for Color' do
      expect(@label.color).to eq 'Red'
    end

    it 'Checks for ITEM length' do
      item = Item.new('2020/11/11', false)
      @label.add_item(item)
      expect(@label.items.length).to eq 1
    end
  end
end
