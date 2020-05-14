require_relative 'ai'
require_relative 'human'
require_relative 'symbols'
require_relative 'board'
require_relative 'minimax'

class Game
  attr_accessor :symbols, :input_source, :move, :current_symbol, :winner, :current_player, :board

  def initialize(board, symbols, current_symbol, input_source)
    @board = board
    @symbols = symbols
    @current_symbol = current_symbol
    @input_source = input_source
  end

  def start
    while(game_not_over)
      @move = get_move
      while(!is_valid_move)
        @move = get_move
      end
      @board.make_move(@move, @current_symbol)
      @current_symbol = symbols.switch(@current_symbol)
    end

    if @board.has_winner?
      @winner = symbols.switch(@current_symbol)
    end

    @winner = "Tie Game"
  end

  private

  def get_move
    if(@current_symbol == symbols.human)
      @current_player = Human.new
      return @current_player.move_strategy(board, @input_source)
    end
    @current_player = Ai.new
    @current_player.move_strategy(board, @symbols)
  end

  def is_valid_move
    board.is_empty_position?(@move) && !board.is_out_of_range?(@move)
  end

  def is_game_over
    @board.has_winner? || @board.tie?
  end

  def game_not_over
    !is_game_over
  end

end