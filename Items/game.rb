require_relative '../Items/item'
require_relative '../helper-classes/input_validation'

class Game < Item
  attr_accessor :publish_date, :last_played, :multiplayer
  attr_reader :id

  def initialize(publish_date, title, last_played, multiplayer, author)
    super(publish_date, title)
    @last_played = last_played
    @multiplayer = multiplayer
    @archived = false
    @current_date = DateTime.now
    @author = author
  end

  def self.create_game(authors)
    puts 'Please fill below game data:'
    print 'Enter Game Title: '
    title = gets.chomp
    print "Author\n\nFirst name:"
    author_first_name = gets.chomp
    print "\n\nLast name: "
    author_last_name = gets.chomp
    print 'Enter Publish date in the following format [dd/mm/yyyy]: '
    date = gets.chomp
    date = InputValidation.get_date(date)
    puts 'Last played:'
    print 'Enter last time played (date) in the following format [dd/mm/yyyy]: '
    last_played = gets.chomp
    last_played = InputValidation.get_date(last_played)
    print 'Is the game multiplayer? [Yes/No]: '
    multiplayer = gets.chomp
    multiplayer = multiplayer.downcase
    author = Author.new(author_first_name, author_last_name)
    authors << author
    new(date, title, last_played, multiplayer, author)
  end

  def self.list_all_games(games)
    puts 'No games added, please add a game by using the list of options.' if games.empty?
    games.each do |game|
      puts "Title: #{game.title} Release date: #{game.publish_date}\n\n\
      Author: #{game.author.first_name} #{game.author.last_name} Multiplayer: #{game.multiplayer}"
    end
  end

  private

  def can_be_archived?
    @archived = super || @current_date.year.to_i - @last_played.to_i > 2
  end
end
