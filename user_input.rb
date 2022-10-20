require 'json'

class UserInput
  SAVE_DATA = './Bookdata/'.freeze
  def self.write_book(books)
    return if books.empty?

    path_file = "#{SAVE_DATA}book.json"
    data_books = books.map do |book|
      {
        id: book.id,
        publisher: book.publisher,
        cover_state: book.cover_state,
        publish_date: book.publish_date
      }
    end
    File.write(path_file, JSON.pretty_generate(data_books))
  end

  def self.write_label(labels)
    return if labels.empty?

    path_file = "#{SAVE_DATA}label.json"
    data_label = labels.map do |label|
      {
        id: label.id,
        title: label.title,
        color: label.color
      }
    end
    File.write(path_file, JSON.pretty_generate(data_label))
  end
end
