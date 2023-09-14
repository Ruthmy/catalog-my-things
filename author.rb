require_relative 'item'

class Author
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @items = []
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
  end

  attr_reader :id, :items

  # has-many relationship with Item
  def add_item(item)
    return unless item.is_a?(Item)

    @items << item
    item.author = self
  end
end
