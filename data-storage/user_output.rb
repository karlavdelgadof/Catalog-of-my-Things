require 'json'

class UserOutput
  def self.load_albums(albums)
    return albums unless File.exist?('./json/albums.json')

    object = JSON.parse(File.read('./json/albums.json'))
    object.each do |album|
      genre = Genre.new(album['genre'])
      album_json = MusicAlbum.new(album['release_date'], album['title'], genre, album['on_spotify'])
      albums << album_json
    end
  end

  def self.load_genres(genres)
    return genres unless File.exist?('./json/genres.json')

    object = JSON.parse(File.read('./json/genres.json'))
    object.each do |genre|
      genre_json = Genre.new(genre['name'])
      genre_json.id = genre['id']
      genres << genre_json
    end
  end

  def self.load_data(albums, genres)
    load_albums(albums)
    load_genres(genres)
  end
end
