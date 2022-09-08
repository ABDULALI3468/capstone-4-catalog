require_relative 'app'
require_relative 'cli'

def main
  app = App.new
  cli = Cli.new

  loop do
    choice = app.print_main_menu
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
    when 4
      app.list_all_albums
    when 5
      app.list_all_genres
    when 6
      app.create_music_album
    when 7
      app.create_genre
    else
      puts 'App quitting gracefully..'
      break
    end
  end
  app.quit
end

main
