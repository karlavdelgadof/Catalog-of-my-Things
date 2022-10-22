require_relative '../Items/item'
require_relative '../Items/game'
require_relative '../properties/author'

describe Game do
  before :each do
    @author = Author.new('jsd', 'ase')
    @game = Game.new('22-02-1998', 'title', '10/10/2022', 'Yes', @author)
  end

  it 'Test Game method' do
    expect(@game.title).to eq 'title'
  end

  it 'Test Game method' do
    expect(@game.multiplayer).to eq 'Yes'
  end

  it 'Test Game method' do
    expect(@game.publish_date).to eq '22-02-1998'
  end

  it 'Test Game method' do
    expect(@game.last_played).to eq '10/10/2022'
  end

  it 'Test Author method' do
    expect(@author.last_name).to eq 'ase'
  end

  it 'Test Game method' do
    expect(@game.move_to_archive).to eq true
  end
end
