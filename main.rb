require_relative 'cli'

def main
  cli = Cli.new
  loop do
    choice = cli.print_main_menu
    case choice
    when 1
      puts 'Listing all items'
    when 2
      puts 'Getting items by ID'
    else
      puts 'App quitting gracefully..'
      break
    end
  end
end

main
