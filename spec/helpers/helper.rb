class Helper

  def fill_board(board, positions, symbols)
    positions.zip(symbols).each do |position, symbol|
      board.make_move(position, symbol)
    end
    board
  end

end