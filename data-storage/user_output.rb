class UserOutput
  def self.read_movie(movies)
    return movies unless File.exist?('./json/movie.json')

    object = JSON.parse(File.read('./json/movie.json'))
    object.each do |movie|
      source = Source.new(movie['source'])
      data_movie = Movie.new(movie['publish_date'], movie['title'], movie['is_silent'], source)
      movies << data_movie
    end
  end

  def self.load_sources(sources)
    return sources unless File.exist?('./json/sources.json')

    object = JSON.parse(File.read('./json/sources.json'))
    object.each do |source|
      source_json = Source.new(source['name'])
      source_json.id = source['id']
      sources << source_json
    end
  end

  def self.read_game(games)
    return games unless File.exist?('./json/game.json')

    object = JSON.parse(File.read('./json/game.json'))
    object.each do |game|
      author = Author.new(game['author']['first_name'], game['author']['last_name'])
      data_game = Game.new(game['publish_date'], game['title'], game['last_played'], game['multiplayer'], author)
      games << data_game
    end
  end

  def self.read_author(authors)
    return authors unless File.exist?('./json/author.json')

    object = JSON.parse(File.read('./json/author.json'))
    object.each do |author|
      data_author = Author.new(author['first_name'], author['last_name'])
      authors << data_author
    end
  end

  def self.load_albums(albums)
    return albums unless File.exist?('./json/albums.json')

    object = JSON.parse(File.read('./json/albums.json'))
    object.each do |album|
      genre = Genre.new(album['genre'])
      album_json = MusicAlbum.new(album['release_date'], album['title'], genre, album['on_spotify'])
      albums << album_json
    end
  end

  def self.load_genres(genres)
    return genres unless File.exist?('./json/genres.json')

    object = JSON.parse(File.read('./json/genres.json'))
    object.each do |genre|
      genre_json = Genre.new(genre['name'])
      genre_json.id = genre['id']
      genres << genre_json
    end
  end

  def self.load_data(games, authors, movies, sources, albums, genres)
    read_game(games)
    read_author(authors)
    read_movie(movies)
    load_sources(sources)
    load_albums(albums)
    load_genres(genres)
  end
end
