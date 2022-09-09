require 'date'
require_relative '../book'

describe 'Book' do
  before :each do
    @book = Book.new(
      publisher: 'ABDUL ALI',
      cover_state: 'Great',
      publish_date: Date.parse('2020-11-11')
    )
  end

  context 'Check the Book class working smoothly' do
    it 'Checks for Instance' do
      expect(@book).to be_instance_of Book
    end

    it 'Checks for Publisher' do
      expect(@book.publisher).to eq 'ABDUL ALI'
    end

    it 'Checks for Cover State' do
      expect(@book.cover_state).to eq 'Great'
    end

    it 'Checks for date' do
      expect(@book.publish_date).to eq Date.parse('2020-11-11')
    end

    it 'Checks for archived' do
      expect(@book.archived).to eq false
    end
  end
end
