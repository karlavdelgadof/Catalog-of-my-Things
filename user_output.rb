class UserOutput
  def self.read_book(books)
    return books unless File.exist?('./Book_Json/book.json')

    object = JSON.parse(File.read('./Book_Json/book.json'))
    object.each do |book|
      data_book = Book.new(book['publisher'], book['cover_state'], book['publish_date'], book['label'])
      books << data_book
    end
  end

  def self.read_label(labels)
    return labels unless File.exist?('./Book_Json/label.json')

    object = JSON.parse(File.read('./Book_Json/label.json'))
    object.each do |label|
      data_label = Label.new(label['publisher'], label['cover_state'], label['publish_date'], label['label'])
      labels << data_label
    end
  end

  def self.load_data(books, labels)
    read_book(books)
    read_label(labels)
  end
end
