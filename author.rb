require_relative 'item'

class Author
  attr_accessor :first_name, :last_name
  @items = []

  def initialize(first_name, last_name)
    self.class.id_counter = (self.class.id_counter || 0) + 1
    @first_name = first_name
    @last_name = last_name
    @id = self.class.id_counter
  end

  attr_reader :id, :items

  # has-many relationship with Item
  def add_item(item)
    @items << item if item.is_a?(Item)
    item.author = self
  end
end
