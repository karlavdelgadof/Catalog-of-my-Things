require 'securerandom'

class Genre
    attr_accessor :id, :name
    attr_reader :albums

    def initialize(name)
        @id = SecureRandom.random_number(1000)
        @name = name
        @albums = []
    end
    
    def add_album(album)
        @albums << album unless @albums.include?(album)
        album.genre = self
    end

    def self.list_all_genres(genres)
      puts 'No genres found, please add a new album.' if genres.empty?
      genres.each do |genre|
            puts "+ #{genre.name}\n\n"
        end
    end
end