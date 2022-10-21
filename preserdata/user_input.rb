require 'json'

class UserInput
  SAVE_DATA = './Bookdata/'.freeze
  def self.write_book(books)
    return if books.empty?

    path_file = "#{SAVE_DATA}book.json"
    data_books = books.map do |book|
      {
        id: book.id,
        title: book.title,
        publisher: book.publisher,
        title_label: book.label.title_label,
        color: book.label.color,
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
        title: label.title_label,
        color: label.color
      }
    end
    File.write(path_file, JSON.pretty_generate(data_label))
  end
end
