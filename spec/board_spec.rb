require '../ttt/Board'

describe Board do
  it"display hello world" do
    board = Board.new
    message = board.Say
    expect(message).to eq("hello world")
  end
end


