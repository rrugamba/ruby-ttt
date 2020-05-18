require_relative 'player'
require_relative 'minimax'

class Ai
  include Player

  def move_strategy(board, symbols)
    minimax = Minimax.new(board, symbols)
    minimax.get_best_move
  end
end