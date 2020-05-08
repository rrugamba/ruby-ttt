require '../ttt/Board'

describe Board do
  it"display hello world" do
    board = Board.new
    message = board.display
    expect(message).to eq("hello world")
  end
end


