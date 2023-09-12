require_relative 'items'
class Book < Item
  def initialize(publisher, cover_state, id, publish_date, archived: false)
    super(id, publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super
    return false if cover_state.downcase == 'bad'
  end
end