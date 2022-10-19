require_relative '../Items/item'
require 'date'
class Game < Item
  attr_accessor :publish_date, :last_played, :multiplayer
  attr_reader :id

  def initialize(publish_date, last_played, multiplayer, author)
    super(publish_date)
    @last_played = last_played
    @multiplayer = multiplayer
    @archived = false
    @current_date = DateTime.now
    @author = author
  end

  def as_hash
    {
      'multiplayer' => @multiplayer,
      'last_played' => @last_played,
      'publish_date' => @publish_date,
      'archived' => @archived
    }
  end

  def self.create_game(authors)
    puts 'Please fill below game data:'
    print "Author\n\nFirst name:"
    author_first_name = gets.chomp
    print "\n\nLast name: "
    author_last_name = gets.chomp
    print 'Enter Publish date in the following format [m/d/y]: '
    date = gets.chomp
    puts 'Last played:'
    print 'Enter last time played (date) in the following format [m/d/y]: '
    last_played = gets.chomp
    print 'Is the game multiplayer? [Yes/No]: '
    multiplayer = gets.chomp
    author = Author.new(author_first_name, author_last_name)
    authors << author
    new(date, last_played, multiplayer, author)
  end

  def self.list_all_games(games)
    puts 'No games added, please add a game by using the list of options.' if games.empty?
    games.each do |game|
      puts "Release date: #{game.publish_date}
      Author: #{game.author.first_name} #{game.author.last_name} Multiplayer: #{game.multiplayer}"
    end
  end

  private

  def can_be_archived?
    @archived = super || @current_date.year - @last_palyed > 2
  end
end
