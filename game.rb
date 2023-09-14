require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(options = {})
    super(options[:genre], options[:author], options[:label], options[:publish_date])
    @multiplayer = options[:multiplayer]
    @last_played_at = Date.parse options[:last_played_at]
  end

  def can_be_archived?
    return true if super && Time.now.year - @last_played_at.year > 2

    false
  end
end
