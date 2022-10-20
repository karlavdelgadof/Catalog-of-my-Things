class UserOutput
  def self.read_game(games)
    return games unless File.exist?('./Json/game.json')

    object = JSON.parse(File.read('./Json/game.json'))
    object.each do |game|
      data_game = Game.new(game['publish_date'], game['title'], game['last_played'], game['multiplay'], game['author'])
      games << data_game
    end
  end

  def self.read_author(authors)
    return authors unless File.exist?('./Json/author.json')

    object = JSON.parse(File.read('./Json/author.json'))
    object.each do |author|
      data_author = Author.new(author['first_name'], author['last_name'])
      authors << data_author
    end
  end

  def self.load_data(games, authors)
    read_game(games)
    read_author(authors)
  end
end
