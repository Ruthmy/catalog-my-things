class Item
  attr_accessor :genre, :author, :label, :publish_date

  def initialize(genre, author, label, publish_date)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @id = Random.rand(1..1000)
    @archived = false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  attr_reader :id, :archived

  private

  def can_be_archived?
    return true if Time.now.year - @publish_date.to_i > 10

    false
  end
end