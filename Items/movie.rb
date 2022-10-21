require_relative 'item'
require_relative '../source/source'
require_relative '../src/input_validation'
require './properties/source'

class Movie < Item
  attr_accessor :source, :silent

  def initialize(publish_date, title, silent, source)
    super(publish_date, title)
    @silent = silent
    @source = source
  end

  def add_source(source)
    source.movies.push(self) unless source.movies.include?(self)
  end

  def self.list_all_movies(movies)
    puts 'No movies added, please add a movie by using the list of options.' if movies.empty?
    movies.each_with_index do |movie, index|
      puts "#{index + 1}) Title: #{movie.title}  Publish date: #{movie.publish_date}   Source: #{movie.source.name} "
    end
  end

  def self.create_movie(sources)
    print 'Enter the movie title: '
    title = gets.chomp
    print 'Enter Publish date in the following format [dd/mm/y]: '
    date = gets.chomp
    date = InputValidation.get_date(date)
    print 'Is the movie silent? [Yes/No]: '
    is_silent = gets.chomp
    is_silent = is_silent.downcase
    print 'Source: '
    selected_source = gets.chomp
    source = Source.new(selected_source)
    sources << source
    new(date, title, is_silent, source)
  end

  private

  def can_be_archived?
    super || @silent == 'yes'
  end
end
