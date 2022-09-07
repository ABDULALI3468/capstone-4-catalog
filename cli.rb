class Cli
  def initialize
    puts 'Welcome to "Catalog Of My Things" app!'
    puts
  end

  def print_main_menu
    puts 'Please choose and option by entering a number:'
    puts '1 - List all items'
    puts '2 - Print item by ID'
    puts '3 - List all music albums'
    puts '4 - List all genres'
    puts '5 - Add music album'
    puts '6 - Add genre'
    puts 'Q - Exit'

    read_menu_input(1..6)
  end

  def read_menu_input(range = (1..2))
    input = gets.chomp.to_i
    input = nil unless range.include?(input)

    input
  end

  def read_input(label)
    print "#{label}: "
    gets.chomp
  end
end
