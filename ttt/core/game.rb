require_relative 'ai'
require_relative 'human'
require_relative 'symbols'
require_relative 'board'
require_relative 'minimax'

module Core

  class Game
    
    attr_accessor :board, :symbols, :current_symbol,
                  :input_source, :display_source

    def initialize(board, symbols, current_symbol,
                   input_source, display_source)
      @board = board
      @symbols = symbols
      @current_symbol = current_symbol
      @input_source = input_source
      @display_source = display_source
    end

    def start
      human_player = Human.new
      ai_player = Ai.new

      while(game_not_over)
        display_source.print(@board)
        move = get_move(ai_player, human_player)
        
        while(not_valid(move))
          display_source.invalid_move
          move = get_move(ai_player, human_player)
        end
        
        @board.make_move(move, @current_symbol)
        @current_symbol = @symbols.switch(@current_symbol)
      end

      if @board.has_winner?
        display_source.print(@board)
        return "winner is #{@symbols.switch(@current_symbol)}"
      end

      "Tie Game"

    end

    private

    def get_move(ai_player, human_player)
      
      if @current_symbol == @symbols.human
        move = human_player.move_strategy(@input_source)
        return move.to_i
      else
        sleep(0.9)
        move = ai_player.move_strategy(@board, @symbols)
        puts "ai best move is #{move + 1}"
        sleep(0.9)
        return move + 1
      end

    end

    def not_valid(move)
      !is_valid(move)
    end

    def is_valid(move)
      @board.is_empty_position?(move) && !@board.is_out_of_range?(move)
    end

    def game_not_over
      !is_game_over
    end

    def is_game_over
      @board.has_winner? || @board.tie?
    end

end

end