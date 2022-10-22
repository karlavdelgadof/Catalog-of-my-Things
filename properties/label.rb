require 'securerandom'

class Label
  attr_accessor :id, :title_label, :color
  attr_reader :books

  def initialize(title_label, color)
    @id = SecureRandom.random_number(1000)
    @title_label = title_label
    @color = color
    @books = []
  end

  def add_book(book)
    @books << book unless @books.include?(book)
    book.label = self
  end

  def self.list_all_labels(labels)
    if labels.empty?
      puts 'Add book first to see label'
    else
      labels.each_with_index do |label, index|
        puts "#{index + 1})  Title: #{label.title_label}  Color: #{label.color}\n\n "
      end
    end
  end
end
