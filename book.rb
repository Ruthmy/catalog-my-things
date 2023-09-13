require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, genre, author, source, label, publish_date, archived = false)
    super(genre, author, source, label, publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_json
    {
      'publisher' => @publisher,
      'cover_state' => @cover_state,
      'item_data' => super
    }.to_json
  end

  def self.from_json(json)
    data = JSON.parse(json)
    item_data = data['item_data']
    item = super(item_data.to_json)

    new(
      data['publisher'],
      data['cover_state'],
      item.genre,
      item.author,
      item.source,
      item.label,
      item.publish_date,
      item.archived
    )
  end
end
