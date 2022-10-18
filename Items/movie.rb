require_relative 'item'
require './source/source'

class Movie < Item
  attr_accessor :title, :silent, :source
  def initialize(publish_date, title, silent, source)
    super(publish_date)
    @silent = silent
    @source = source
    @title = title
  end

  def add_source(source)
    source.movies.push(self) unless source.movies.include?(self)
  end

  def self.lits_all_movies(movies)
    movies.each do |movie|
      puts "Title: #{movie.title} Publish date: #{movie.publish_date}  Source: #{movie.source.name}\n\n"
    end    
  end

  def self.create_movie(sources)
    print 'Title of the movie: '
    title = gets.chomp
    print 'Enter Publish date in the following format [m/d/y]: '
    date = gets.chomp
    print 'Is the movie silent? [Y/N]: '
    is_silent = gets.chomp
    is_silent = is_silent.downcase == 'y'
    print 'Source: '
    selected_source = gets.chomp

    source = Source.new(selected_source)
    new(date, title, is_silent, source)
  end
    
  private
    
  def can_be_archived?
    super || @silet
  end
end