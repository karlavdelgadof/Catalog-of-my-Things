require 'json'
class UserInput
  SAVE_DATA = './datasave/'.freeze
  def self.write_movie(movies)
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
end
