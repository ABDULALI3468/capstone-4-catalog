require_relative 'app'

def main
  app = App.new

  loop do
    choice = app.print_main_menu
    case choice
    when 1..7
      app.process_listing(choice)
    when 8..11
      app.process_creating(choice)
    when 'Q'
      puts 'App quitting gracefully..'
      break
    else
      puts
      puts('[ERROR]!!~INVALID_OPTION')
    end

    puts('-' * 70)
    puts
  end
  app.quit
end

main
