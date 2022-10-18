require 'securerandom'

class Source
  attr_accessor :id, :name
  attr_reader :items

  def initialize(name)
    @id = SecureRandom.random_number(1000)
    @name = name
    @movies = []
  end

  def add_movie(movie)
    @movies << movie unless @movies.include?(movie)
    movie.source = self
  end

  def self.list_all_sources(sources)
    puts 'No sources found.' if sources.empty?
    sources each do |source|
      puts "- [#{source.item.class}] Name: #{source.name}"
    end
  end
end
