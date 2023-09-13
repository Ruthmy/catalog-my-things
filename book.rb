# book.rb

require_relative 'item'

class Book < Item
  attr_accessor :genre, :author, :label, :publish_date, :cover_state, :publisher, :id, :archived

  # rubocop:disable Lint/MissingSuper
  def initialize(attributes)
    @genre = attributes[:genre]
    @author = attributes[:author]
    @label = attributes[:label]
    @publish_date = attributes[:publish_date]
    @cover_state = attributes[:cover_state]
    @publisher = attributes[:publisher]
    @id = Random.rand(1..1000)
    @archived = false
  end
  # rubocop:enable Lint/MissingSuper

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
