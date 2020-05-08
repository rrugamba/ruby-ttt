class Board
  @dimension
  @length
  @array

  def initialize(size)
    @dimension = size
    @length = size ** 2
    @array = Array.new(@length) { |index| index += 1 }
  end

  def length
    @length
  end

  def current_state
    @array
  end

  def make_move(position, symbol)
    @array[position] = symbol
  end
  
  def available_spots
    @array.select { |index| index.is_a? Integer }
          .length
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