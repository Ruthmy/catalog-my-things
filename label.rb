class Label
  attr_accessor :title, :id

  @items = []

  def initialize(title)
    @title = title
    @id = Random.rand(1..1000) # assuming every label has a unique ID
  end

  attr_reader :items

  def add_item(item)
    @items << item
    item.label = self
  end
end
