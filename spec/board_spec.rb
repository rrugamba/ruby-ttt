require '../ttt/Board'

describe Board do
  it "creates a board of any size" do
    board = Board.new(3)
    expect(board.size).to eq(9)
  end

  it "instantiates an empty board in memory" do
    board = Board.new(3)
    array = board.current_state
    expect(array).to eq([1,2,3,4,5,6,7,8,9])
  end

  it "makes a move on the board" do
    board = Board.new(3)
    board.make_move(0, 'x')
    expect(board.current_state).to eq(['x',2,3,4,5,6,7,8,9])
  end

  it "gets current number of available spots on empty board" do
    board = Board.new(3)
    expect(board.current_state).to eq([1,2,3,4,5,6,7,8,9])
    expect(board.available_spots).to eq(9)
  end

  it "gets current number of available spots on board" do
    board = Board.new(3)
    board.make_move(4, 'x')

    expect(board.current_state).to eq([1,2,3,4,'x',6,7,8,9])
    expect(board.available_spots).to eq(8)
  end
  
end


