class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived

  def initialize(genre, author, source, label, publish_date, archived = false)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def to_json
    {
      'genre' => @genre.to_json,
      'author' => @author.to_json,
      'source' => @source,
      'label' => @label.to_json,
      'publish_date' => @publish_date,
      'archived' => @archived
    }.to_json
  end

  def self.from_json(json)
    data = JSON.parse(json)
    genre = Genre.from_json(data['genre'])
    author = Author.from_json(data['author'])
    label = Label.from_json(data['label'])

    new(
      genre,
      author,
      data['source'],
      label,
      data['publish_date'],
      data['archived']
    )
  end
end
