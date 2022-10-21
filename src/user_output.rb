class UserOutput
  def self.read_movie(movies)
    return movies unless File.exist?('./datasave/movie.json')

    object = JSON.parse(File.read('./datasave/movie.json'))
    object.each do |movie|
      source = Source.new(movie['source'])
      data_movie = Movie.new(movie['publish_date'], movie['title'], movie['is_silent'], source)
      movies << data_movie
    end
  end

  def self.load_sources(sources)
    return sources unless File.exist?('./datasave/sources.json')

    object = JSON.parse(File.read('./datasave/sources.json'))
    object.each do |source|
      source_json = Source.new(source['name'])
      source_json.id = source['id']
      sources << source_json
    end
  end

  def self.read_game(games)
    return games unless File.exist?('./Json/game.json')

    object = JSON.parse(File.read('./Json/game.json'))
    object.each do |game|
      data_game = Game.new(game['publish_date'], game['title'], game['last_played'], game['multiplay'], game['author'])
      games << data_game
    end
  end

  def self.read_author(authors)
    return authors unless File.exist?('./Json/author.json')

    object = JSON.parse(File.read('./Json/author.json'))
    object.each do |author|
      data_author = Author.new(author['first_name'], author['last_name'])
      authors << data_author
    end
  end

  def self.load_data(games, authors, movies, sources)
    read_game(games)
    read_author(authors)
    read_movie(movies)
    load_sources(sources)
  end
end
