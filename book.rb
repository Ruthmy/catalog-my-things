require_relative 'item'

class Book < Item
  class << self
    attr_accessor :id_counter
  end
  @id_counter = 0

  def initialize(publisher:, cover_state:, **args)
    super(args[:genre], args[:author], args[:source], args[:label], args[:publish_date])
    @publisher = publisher
    @cover_state = cover_state

    self.class.id_counter += 1
    @id = self.class.id_counter
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
