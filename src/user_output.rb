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

  def self.load_data(movies, sources)
    read_movie(movies)
    load_sources(sources)
  end
end
