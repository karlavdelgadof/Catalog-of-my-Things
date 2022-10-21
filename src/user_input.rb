require 'json'
require 'fileutils'
require 'json'
require_relative '../Items/game'
require_relative './author'

class UserInput
  SAVE_DATA = './datasave/'.freeze
  def self.write_movies(movies)
    return if movies.empty?

    path_file = "#{SAVE_DATA}movie.json"
    data_movie = movies.map do |movie|
      {
        id: movie.id,
        title: movie.title,
        publish_date: movie.publish_date,
        source: movie.source.name,
        is_silent: movie.silent
      }
    end
    File.write(path_file, JSON.pretty_generate(data_movie))
  end

  def self.save_sources(sources)
    sources_json = []
    sources.each do |source|
      source = {
        id: source.id.to_s,
        name: source.name
      }
      sources_json << source
    end
    File.write('./datasave/sources.json', JSON.pretty_generate(sources_json, { indent: "\t", object_nl: "\n" }))
  end

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
