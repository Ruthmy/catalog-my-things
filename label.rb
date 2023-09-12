class Label
    attr_accessor :title, :color
  
    def initialize(id, title, color)
      @id = id
      @title = title
      @color = color
      @items = []
    end
  
    def add_item(item)
      item.label = self
      @items << item
    end
  end