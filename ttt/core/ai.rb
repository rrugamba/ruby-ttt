require_relative 'player'
require_relative 'minimax'

module Core

  class Ai
    
    def move_strategy(board, symbols)
      minimax = Minimax.new(board, symbols)
      minimax.get_best_move
    end

  end

end