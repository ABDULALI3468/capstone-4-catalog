require 'json'
require_relative 'game'

class GameFile
  def initialize
    @file_path = './data/games.json'
  end

  def read
    return unless File.exist?(@file_path)

    JSON.parse(File.read(@file_path))
  end

  def save(game_collection = [])
    create_dir(@file_path) unless File.exist?(@file_path)
    File.write(@file_path, JSON.pretty_generate(game_collection))
  end

  def create_dir(path)
    dirname = File.dirname(path)
    FileUtils.mkdir_p(dirname) unless File.directory?(dirname)
    File.new(path, 'w')
  end
end
