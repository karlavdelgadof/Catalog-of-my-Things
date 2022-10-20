require 'json'
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
        name: source.name,
      }
      sources_json << source
    end
    File.write('./datasave/sources.json', JSON.pretty_generate(sources_json, { indent: "\t", object_nl: "\n" }))
  end
end
