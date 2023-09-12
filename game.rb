require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    if item.can_be_archived? && Time.now.year - @last_played_at.year > 2
      return true
    else
      return false
    end
  end
end
