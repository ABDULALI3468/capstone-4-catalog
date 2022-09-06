require_relative 'cli'

def main
  cli = Cli.new
  loop do
    choice = cli.print_main_menu
    case choice
    when 1
      puts 'Listing all books'
      cli.list_books
    when 2
      puts 'List all labels'
      cli.list_labels
    when 3
      puts 'Add a book'
      cli.create_book
    else
      puts 'App quitting gracefully..'
      break
    end
  end
end

main
