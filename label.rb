class Label
  attr_accessor :title, :color, :id

  @items = []

  def initialize(title, color = 'default')
    @title = title
    @color = color
    @id = Random.rand(1..1000)
  end

  attr_reader :items

  def add_item(item)
    @items << item
    item.label = self
  end
end
