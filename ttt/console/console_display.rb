class ConsoleDisplay

  def print(board)
    puts '_'*8
    puts "#{board.array[0].to_s} | #{board.array[1].to_s} | #{board.array[2].to_s}"
    puts "#{board.array[3].to_s} | #{board.array[4].to_s} | #{board.array[5].to_s}"
    puts "#{board.array[6].to_s} | #{board.array[7].to_s} | #{board.array[8].to_s}"
    puts '-'*8
  end

  def invalid_move
    puts "#{'*'*8} invalid move #{'*'*8}"
  end
end