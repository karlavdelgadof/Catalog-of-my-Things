require 'securerandom'

class Author
  attr_accessor :id, :first_name, :last_name
  attr_reader :items

  def initialize(first_name, last_name)
    @id = SecureRandom.random_number(1000)
    @first_name = first_name
    @last_name = last_name
    @games = []
  end

  def add_game(game)
    @games << game unless @games.include?(game)
    game.author = self
  end

  def self.list_all_authors(authors)
    if authors.empty?
      puts 'Add game first to see author'
    else
      authors.each_with_index do |author, index|
        puts "- #{index + 1} ) Full name: #{author.first_name} #{author.last_name}"
      end
    end
  end
end
