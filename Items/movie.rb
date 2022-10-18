require_relative 'item'
require './source/source'

class Movie < Item
  def initialize(publish_date, silent, source)
    super(publish_date)
    @silent = silent
    @source = source
  end

  def add_source(source)
    source.movies.push(self) unless source.movies.include?(self)
  end

  def self.lits_all_movies(movies)
    movies.each do |movie|
      puts "Publish: #{movie.publish_date}  Source: #{movie.source.name} "
    end    
  end

  def self.create_movie(sources)
    print "Author\n\nFirst name:"
    author_first_name = gets.chomp
    print "\n\nLast name: "
    author_last_name = gets.chomp
    print 'Enter Publish date in the following format [m/d/y]: '
    date = gets.chomp
    print 'Is the movie silent? [Y/N]: '
    is_silent = gets.chomp
    is_silent = is_silent.downcase == 'y'
    print 'Source: '
    selected_source = gets.chomp

    source = Source.new(selected_source)
    new(date, is_silent, source)
  end
    
  private
    
  def can_be_archived?
    super || @silet
  end
end