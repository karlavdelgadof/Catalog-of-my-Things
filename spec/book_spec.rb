require_relative '../Items/item'
require_relative '../Items/book'
require_relative '../properties/source'

describe Book do
  before :each do
    @label = Label.new('Karla', 'Blue')
    @book = Book.new('22-02-2018', 'William Morrow', 'good', @label)
  end

  it 'Test Book attributes' do
    expect(@book.publisher).to eq 'William Morrow'
  end

  it 'Test Book attributes' do
    expect(@book.cover_state).to eq 'good'
  end

  it 'Test Book attributes' do
    expect(@book.label).to eq @label
  end

  it 'test book attributes' do
    expect(@book.archived).to eq false
  end
end
