require 'securerandom'
require 'date'

class Item
  attr_accessor :id, :publish_date, :archived, :source, :genre, :label, :author, :title

  def initialize(publish_date, title)
    @id = SecureRandom.random_number(1000)
    @publish_date = publish_date
    @current_date = DateTime.now
    @archived = archived
    @title = title
  end

  def add_source(source)
    @source = source
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_label(label)
    @label = label
  end

  def add_author(author)
    @author = author
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    (@current_date.year - @publish_date) > 10
  end
end
