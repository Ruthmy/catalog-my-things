class Author
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    self.class.id_counter = (self.class.id_counter || 0) + 1
    @first_name = first_name
    @last_name = last_name
    @id = self.class.id_counter
    @items = []
  end

  attr_reader :id, :items
end
