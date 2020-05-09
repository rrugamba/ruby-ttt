require_relative 'Player'
require_relative 'Get'

class Human
  include Player

  def move_strategy(board, input_source)
    input_source.get_move(board)
  end

end
