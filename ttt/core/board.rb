module Core

  class Board
   
    attr_reader :dimension, :length, :array

    def initialize(size)
      @dimension = size
      @length = size ** 2
      @array = Array.new(@length) { |index| index += 1 }
    end

    def update_board_state(board_array)
      @array = board_array
    end

    def is_empty_position?(position)
      @array[position - 1].is_a? Integer
    end

    def is_out_of_range?(position)
      actual_position = position - 1
      actual_position < 0 || actual_position > length
    end

    def make_move(position, symbol)
      @array[position - 1] = symbol
    end

    def current_state
      @array
    end

    def number_of_empty_positions
      @array.select { |index| index.is_a? Integer }
            .length
    end

    def find_all_empty_positions
      @array.select { |cell| cell.is_a? Integer }
          .map { |value| value - 1 }
    end

    def tie?
      !has_winner? && number_of_empty_positions == 0
    end

    def has_winner?
      is_horizontal_win? || is_vertical_win? || is_diagonal_win?
    end

    def is_horizontal_win?
      @array[0] == @array[1] && @array[1] == @array[2] ||
      @array[3] == @array[4] && @array[4] == @array[5] ||
      @array[6] == @array[7] && @array[7] == @array[8]
    end

    def is_vertical_win?
      @array[0] == @array[3] && @array[3] == @array[6] ||
      @array[1] == @array[4] && @array[4] == @array[7] ||
      @array[2] == @array[5] && @array[5] == @array[8]
    end

    def is_diagonal_win?
      @array[0] == @array[4] && @array[4] == @array[8] ||
      @array[2] == @array[4] && @array[4] == @array[6]
    end
    
  end

end