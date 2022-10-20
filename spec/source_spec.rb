require './source/source'
require './Items/movie'


describe Source do
  before :each do
    @source = Source.new('Movie Store')
    @movie = Movie.new('03/03/2001', 'Nemo', 'no', @source)
  end

  it 'Should equal the values provided to the constructor class' do
    expect(@source.name).to eql 'Movie Store'
    expect(@source.id).to eql @source.id

  end

  it 'Should be an object instance of the Source class' do
    expect(@source).to be_an_instance_of Source
  end

  it 'Source movies should return an empty array' do
    expect(@source.movies).to eq []
  end

  it 'Source movies should return an empty array' do
    new_movies = [@movie]
    @source.add_movie(@movie)
    expect(@source.movies).to eq new_movies
  end
end