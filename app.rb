require 'colorize'
require './Items/movie'
require './Items/music_album'
require './properties/genre'
require './properties/source'
require './Items/book'
require './properties/label'

class App
	def initialize()
    @books = []
    @albums = []
    @movies = []
		@games = []
		@labels = []
		@genres = []
		@sources = []
		@authors = []
  end

  def options
    [
      '[1] => List all books',
      '[2] => List all music albums',
      '[3] => List all movies',
      '[4] => List all games',
      '[5] => List all genres',
      '[6] => List all labels',
      '[7] => List all authors',
      '[8] => List all sources',
      '[9] => Add a book',
      '[10] => Add a music album',
      '[11] => Add a movie',
      '[12] => Add a game',
      '[13] => Exit'
    ]
  end

  def run
    user_response = 0
    puts "\n\nWelcome to the Catalog of my Things!\n\n".colorize(color: :green).bold

    while user_response != '13'
      puts "Please choose an option by entering a number:\n\n".colorize(color: :magenta).italic
      options.each do |choice|
        if choice.include?('Exit')
          puts choice.colorize(color: :red)
        else
          puts choice
        end
      end
      print "\n\nEnter Option [number]: ".colorize(color: :white).bold
      user_response = gets.chomp
      puts "\n\n"
      check_selection(user_response)
    end

    puts "Thank you for using this app!\n\n".colorize(color: :cyan).bold if user_response == '13'
  end

  def check_selection(response)
    case response
    when '1'
      Book.list_all_books(@books)
    when '2'
      MusicAlbum.list_all_albums(@albums)
    when '3'
      Movie.list_all_movies(@movies)
    when '4'
      list_all_games
    when '5'
      Genre.list_all_genres(@genres)
    when '6'
      Label.list_all_labels(@labels)
    when '7'
      list_all_authors
    when '8'
      Source.list_all_sources(@sources)
    when '9'
      book = Book.create_book(@labels)
      @books << book
      puts "\n\nBook added successfully!\n\n".colorize(color: :green).italic if @books.include?(book)
    when '10'
      album = MusicAlbum.create_album(@genres)
      @albums << album
      puts "\n\nMusic album added successfully!\n\n".colorize(color: :green).italic if @albums.include?(album)
    when '11' 
			movie= Movie.create_movie(@sources)
      @movies << movie
      puts "\n\nMovie added successfully!\n\n".colorize(color: :green).italic if @movies.include?(movie)
    when '12'
      create_game
    end
  end
end
