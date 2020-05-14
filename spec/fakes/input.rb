class Input
  attr_accessor :move

  def initialize(move)
    @move = move
  end

  def get_move(board)
    @move
  end
end