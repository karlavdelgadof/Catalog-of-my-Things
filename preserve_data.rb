require 'fileutils'
require 'json'
require './Game/game'
require './author'

class PreserveData
  # write game

  def self.write_games(game)
    game_array = []
    games.each do |game|
      game_array << {
        first_name: game.first_name,
        last_name: game.last_name
      }
    end
    File.write('./data/games.json', JSON.pretty_generate(game_array))
  end

  # read book
  def self.read_games(_game)
    game_array = []
    return game_array unless File.exist?('data/games.json')

    game_file = File.open('./data/games.json')
    data = JSON.parse(game_file.read)
    data.each do |game|
      game_array << Game.new(game['first_name'], game['last_name'])
    end
    game_file.close
    game_array
  end
end
