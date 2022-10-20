require './Items/music_album'
require './properties/genre'


describe MusicAlbum do
  before :each do
    @genre = Genre.new('Country')
    @album = MusicAlbum.new('13/12/1989', 'Speak now', @genre, true)
  end

  it 'Should equal the values provided to the constructor class' do
    expect(@album.publish_date).to eql '13/12/1989'
    expect(@album.title).to eql 'Speak now'
    expect(@album.genre).to be @genre
    expect(@album.on_spotify).to be true

  end

  it 'Should be an object instance of the MusicAlbum class' do
    expect(@album).to be_an_instance_of MusicAlbum
  end

  it 'Should return true' do
    @album.move_to_archive
    expect(@album.archived).to be true
  end
end