class Item
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(genre, author, source, label, publish_date)
    self.class.id_counter = (self.class.id_counter || 0) + 1
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @id = self.class.id_counter
    @archived = false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  attr_reader :id, :archived

  def can_be_archived?
    return true if Time.now.year - @publish_date.year > 10

    false
  end
end
