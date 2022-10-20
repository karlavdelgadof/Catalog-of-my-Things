require './source/source'
require './Items/movie'


describe Movie do
  before :each do
    @source = Source.new('Online Platform')
    @movie = Movie.new('11/05/1992', 'Pearl Harbor', 'yes', @source)
  end

  it 'Should equal the values provided to the constructor class' do
    expect(@movie.publish_date).to eql '11/05/1992'
    expect(@movie.title).to eql 'Pearl Harbor'
    expect(@movie.source).to be @source
    expect(@movie.silent).to eql 'yes'

  end

  it 'Should be an object instance of the Movie class' do
    expect(@movie).to be_an_instance_of Movie
  end

  it 'Should return true' do
    @movie.move_to_archive
    expect(@movie.archived).to be true
  end
end