require 'json'

class UserInput
  def self.save_albums(albums)
    albums_json = []
    albums.each do |album|
      album = {
        id: album.id.to_s,
        title: album.title,
        genre: album.genre.name,
        release_date: album.publish_date,
        on_spotify: album.on_spotify.to_s
      }
      albums_json << album
    end
    File.write('./json/albums.json', JSON.pretty_generate(albums_json, { indent: "\t", object_nl: "\n" }))
  end

  def self.save_genres(genres)
    genres_json = []
    genres.each do |genre|
      genre = {
        id: genre.id.to_s,
        name: genre.name
      }
      genres_json << genre
    end
    File.write('./json/genres.json', JSON.pretty_generate(genres_json, { indent: "\t", object_nl: "\n" }))
  end

  def self.save_data(albums, genres)
    save_albums(albums)
    save_genres(genres)
  end
end
