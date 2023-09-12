class Item
  attr_accessor :id, :publish_date, :archived

  def initialize(publish_date, id = nil)
    @id = id || Random.rand(1..10_000)
    @genre = []
    @author = []
    @label = []
    @publish_date = publish_date
    @archived = false
  end

  # Setter methods for 1-to-many relationships
  def genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end

  # Methods
  def move_to_archive
    @archived = true if can_be_archived?
  end

  def can_be_archived?
    return true if Time.now.year - @publish_date.year > 10

    false
  end
end
