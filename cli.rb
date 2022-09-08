class Cli

  def initialize
    puts 'Welcome to "Catalog Of My Things" app!'
    puts
  end

  def print_main_menu
    puts 'Please choose and option by entering a number:'
    options = [
      'List all books',
      'List all music albums',
      'List of games',
      'List all genres',
      'List all labels',
      'List all authors',
      'List all sources',
      'Add a book',
      'Add a music album',
      'Add a game',
      'Add genre'
    ]
    options.each.with_index(1) do |option, j|
      puts("#{j} - #{option}")
    end
    puts("Q - Exit")

    read_menu_input(1..11)
  end

  def read_menu_input(range = (1..11))
    input = gets.chomp.strip
    return 'Q' if %w[q Q].include?(input)
    return unless range.include?(input.to_i)

    input.to_i
  end

  def read_input(label)
    print "#{label}: "
    gets.chomp
  end
end
