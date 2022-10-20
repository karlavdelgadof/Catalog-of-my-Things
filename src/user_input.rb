require 'fileutils'
require 'json'
require './Items/game'
require './author'

class UserInput
  SAVE_DATA = './Json/'.freeze
  def self.write_game(games)
    return if games.empty?

    path_file = "#{SAVE_DATA}game.json"
    data_games = games.map do |game|
      {
        id: game.id,
        title: game.title,
        multiplayer: game.multiplayer,
        last_played: game.last_played,
        publish_date: game.publish_date
      }
    end
    File.write(path_file, JSON.pretty_generate(data_games))
  end

  def self.write_author(authors)
    return if authors.empty?

    path_file = "#{SAVE_DATA}author.json"
    data_authors = authors.map do |author|
      {
        id: author.id,
        first_name: author.first_name,
        last_name: author.last_name
      }
    end
    File.write(path_file, JSON.pretty_generate(data_authors))
  end
end
