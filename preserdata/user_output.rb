class UserOutput
  def self.read_book(books)
    return books unless File.exist?('./Bookdata/book.json')

    object = JSON.parse(File.read('./Bookdata/book.json'))
    object.each do |book|
      label = Label.new(book['title'], book['color'])
      data_book = Book.new(book['publisher'], book['cover_state'], book['publish_date'], label)
      books << data_book
    end
  end

  def self.read_label(labels)
    return labels unless File.exist?('./Bookdata/label.json')

    object = JSON.parse(File.read('./Bookdata/label.json'))
    object.each do |label|
      data_label = Label.new(label['title'], label['color'])
      labels << data_label
    end
  end

  def self.load_data(books, labels)
    read_book(books)
    read_label(labels)
  end
end
