require 'securerandom'
require 'date'

class Item
  attr_accessor :id, :publish_date, :archived, :source, :genre, :label, :author
  def initialize(publish_date)
    @id = SecureRandom.random_number(1000)
    @publish_date = Date.strptime(publish_date, '%m/%d/%Y')
    @current_date = DateTime.now
    @archived = false
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

  def move_to_archive(archived)
    archived = can_be_archived?
  end

  private 

  def can_be_archived?
    (@current_date.year - @publish_date) > 10
  end

end