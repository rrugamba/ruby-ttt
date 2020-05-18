require_relative 'player'
require_relative 'get'

class Human
  include Player

  def move_strategy(input_source)
    input_source.get_move
  end

end
