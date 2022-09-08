require 'json'
require 'fileutils'

module Storage
  def path
    FileUtils.mkdir_p('./data') unless File.directory?('./data')
    "./data/#{@name}.json"
  end

  def save
    File.write(path, JSON.pretty_generate(@items))
  end

  def read
    return unless File.exist?(path)

    JSON.parse(File.read(path))
  end
end
