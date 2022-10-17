require 'securerandom'
require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived
  def initialize(genre, author, source, label, publish_date)
    @id = SecureRandom.random_number(1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = Date.strptime(publish_date, '%m/%d/%Y')
    @current_date = DateTime.now
    @archived = false
  end

  def move_to_archive(archived)
    archived = can_be_archived?
  end

  private 

  def can_be_archived?
    (@current_date.year - @publish_date) > 10
  end

end