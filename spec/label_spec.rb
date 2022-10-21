require_relative '../Items/item'
require_relative '../Items/book'
require_relative '../properties/label'

describe Label do
  before :each do
    @label = Label.new('Karla', 'Blue')
    @book = Book.new('22-02-2018', 'Dhl', 'William Morrow', 'good', @label)
  end

  it 'label should return an empty array' do
    expect(@label.books).to eq []
  end

  it 'label book should return an empty array' do
    new_books = [@book]
    @label.add_book(@book)
    expect(@label.books).to eq new_books
  end
end
