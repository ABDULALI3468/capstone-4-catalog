require_relative 'app'

def main
  app = App.new
  loop do
    choice = app.print_main_menu
    case choice
    when 3
      app.list_all_albums
    when 4
      app.list_all_genres
    when 5
      app.create_music_album
    when 6
      app.create_genre
    else
      puts 'App quitting gracefully..'
      break
    end
  end
  app.quit
end

main
