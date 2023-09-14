class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name)
    @id = id || Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  private

  attr_writer :id, :items
end
