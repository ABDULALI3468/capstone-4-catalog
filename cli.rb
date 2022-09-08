require_relative 'store_data'
class Cli
  include DataStore

  def initialize
    @books = load('./Data/books.json')
    @labels = load('./Data/labels.json')
    puts 'Welcome to "Catalog Of My Things" app!'
    puts
  end

  def print_main_menu
    puts 'Please choose and option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all labels'
    puts '3 - Add a book'
    puts '4 - List all music albums'
    puts '5 - List all genres'
    puts '6 - Add music album'
    puts '7 - Add genre'
    puts 'Q - Exit'

    read_menu_input(1..6)
  end

  def create_book
    print 'Who is the Publisher: '
    publisher = gets.chomp
    print 'What is the cover state: '
    cover_state = gets.chomp
    print 'When the book was published: '
    published_date = gets.chomp
    write_books(publisher, cover_state, published_date, @books)
    @books = load('./Data/books.json')
    print 'Book created successfully'
  end

  def list_books
    @books.each_with_index do |book, index|
      puts("(#{index})- Publisher: #{book['publisher']},
      Cover State: #{book['cover_state']} ,
      Published Date: #{book['publish_date']}")
    end
  end

  def list_labels
    @labels.each_with_index do |label, index|
      puts("(#{index})- Title: #{label['title']} , Color: #{label['color']}")
    end
  end

  def read_menu_input(range = (1..3))
    input = gets.chomp.to_i
    input = nil unless range.include?(input)

    input
  end

  def read_input(label)
    print "#{label}: "
    gets.chomp
  end
end
