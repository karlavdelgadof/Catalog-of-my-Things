require 'colorize'
require './Items/item'
require './properties/genre'
require './helper-classes/input_validation'
require 'date'

class MusicAlbum < Item
  attr_accessor :on_spotify, :genre

  def initialize(publish_date, title, genre, on_spotify)
    super(publish_date, title)
    @on_spotify = on_spotify
    @genre = genre
    @archived = false
  end

  def add_genre(genre)
    genre.albums.push(self) unless genre.albums.include?(self)
  end

  def self.list_all_albums(albums)
    puts 'No music albums added, please add an album by using the list of options.' if albums.empty?
    albums.each_with_index do |album, index|
      puts "#{[index + 1]} Title: #{album.title}  Release: #{album.publish_date}\n\n
      Genre: #{album.genre.name} Available on Spotify: #{
        if album.on_spotify
          'available'
        else
          'not available'
        end}\n\n"
    end
  end

  def self.create_album(genres)
    print 'Title: '
    title = gets.chomp
    print 'Enter release date in the following format [dd/mm/yyyy]: '
    date = gets.chomp
    date = InputValidation.get_date(date)
    print 'Genre: '
    genre_input = gets.chomp
    print 'Is the music album on Spotify? [Y/N]: '
    is_on_spotify = gets.chomp
    is_on_spotify = is_on_spotify.downcase == 'y'

    genre = Genre.new(genre_input)
    genres << genre
    new(date, title, genre, is_on_spotify)
  end

  private

  def can_be_archived?
    @archived = super && @on_spotify
  end
end
