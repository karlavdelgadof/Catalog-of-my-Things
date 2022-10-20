class UserOutput
  def self.read_movie(movies)
    return movies unless File.exist?('./datasave/movie.json')

    object = JSON.parse(File.read('./datasave/movie.json'))
    object.each do |movie|
      source = Source.new(movie['source'])
      data_movie = Movie.new(movie['pulish_date'], movie['title'], movie['is_silent'], source)
      movies << data_movie
    end
  end

  def self.load_data(movies)
    read_movie(movies)
  end
end
