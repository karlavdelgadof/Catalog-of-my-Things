require 'json'
require 'fileutils'

class UserInput
  SAVE_DATA = './json/'.freeze

  def self.write_book(books)
    return if books.empty?

    path_file = "#{SAVE_DATA}book.json"
    data_books = books.map do |book|
      {
        id: book.id,
        title: book.title,
        publisher: book.publisher,
        title_label: book.label.title_label,
        color: book.label.color,
        cover_state: book.cover_state,
        publish_date: book.publish_date
      }
    end
    File.write(path_file, JSON.pretty_generate(data_books))
  end

  def self.write_label(labels)
    return if labels.empty?

    path_file = "#{SAVE_DATA}label.json"
    data_label = labels.map do |label|
      {
        id: label.id,
        title: label.title_label,
        color: label.color
      }
    end
    File.write(path_file, JSON.pretty_generate(data_label))
  end

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
    File.write('./json/sources.json', JSON.pretty_generate(sources_json, { indent: "\t", object_nl: "\n" }))
  end

  def self.write_game(games)
    return if games.empty?

    path_file = "#{SAVE_DATA}game.json"
    data_games = games.map do |game|
      {
        id: game.id,
        title: game.title,
        author: {
          first_name: game.author.first_name,
          last_name: game.author.last_name
        },
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

  def self.save_albums(albums)
    albums_json = []
    albums.each do |album|
      album = {
        id: album.id.to_s,
        title: album.title,
        genre: album.genre.name,
        release_date: album.publish_date,
        on_spotify: album.on_spotify.to_s
      }
      albums_json << album
    end
    File.write('./json/albums.json', JSON.pretty_generate(albums_json, { indent: "\t", object_nl: "\n" }))
  end

  def self.save_genres(genres)
    genres_json = []
    genres.each do |genre|
      genre = {
        id: genre.id.to_s,
        name: genre.name
      }
      genres_json << genre
    end
    File.write('./json/genres.json', JSON.pretty_generate(genres_json, { indent: "\t", object_nl: "\n" }))
  end

  def self.save_data(albums, genres)
    save_albums(albums)
    save_genres(genres)
  end
end
