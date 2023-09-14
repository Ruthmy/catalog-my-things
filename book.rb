# book.rb
require_relative 'item'
class Book < Item
  attr_accessor :genre, :author, :label, :publish_date, :cover_state, :publisher, :id, :archived

  def initialize(attributes)
    super(attributes[:genre], attributes[:author], attributes[:label], attributes[:publish_date])
    @cover_state = attributes[:cover_state]
    @publisher = attributes[:publisher]
    @id = Random.rand(1..1000)
    @archived = false
  end

  def can_be_archived?
    super || (@cover_state == 'bad') || (Time.now.year - @publish_date.year > 10)
  end
end
