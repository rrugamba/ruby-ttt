require_relative 'Player'
require_relative 'Minimax'

class Ai
  include Player

  def move_strategy(board, symbols)
    minimax = Minimax.new(board, symbols)
    minimax.get_best_move
  end
end