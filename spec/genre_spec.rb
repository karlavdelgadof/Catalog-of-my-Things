require './properties/genre'
require './Items/music_album'

describe Genre do
  before :each do
    @genre = Genre.new('Pop/Rock')
    @album = MusicAlbum.new('20/11/2021', 'Tickets to my Downfall', @genre, true)
  end

  it 'Should equal the values provided to the constructor class' do
    expect(@genre.name).to eql 'Pop/Rock'
    expect(@genre.id).to eql @genre.id
  end

  it 'Should be an object instance of the MusicAlbum class' do
    expect(@genre).to be_an_instance_of Genre
  end

  it 'Genre albums should return an empty array' do
    expect(@genre.albums).to eq []
  end

  it 'Genre albums should return an empty array' do
    new_albums = [@album]
    @genre.add_album(@album)
    expect(@genre.albums).to eq new_albums
  end
end
