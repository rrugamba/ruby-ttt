require './helpers/Helper'
require '../../ttt/core/Board'

describe Core::Board do
  let(:helper) { Helper.new }
  let(:board) { Core::Board.new(3) }

  context "creating the board, making moves on board" do
    it "creates a 3 x 3 board" do
      expect(board.length).to eq(9)
    end

    it "creates 4 x 4 board" do
      board = Core::Board.new(4)
      expect(board.length).to eq(16)
    end

    it "instantiates an empty board in memory" do
      array = board.current_state
      expect(array).to eq([1,2,3,4,5,6,7,8,9])
    end

    it "makes a move on the board" do
      board.make_move(1, 'x')
      expect(board.current_state).to eq(['x',2,3,4,5,6,7,8,9])
    end

    it "gets current number of available spots on empty board" do
      expect(board.current_state).to eq([1,2,3,4,5,6,7,8,9])
      expect(board.number_of_empty_positions).to eq(9)
    end

    it "gets current number of available spots on board" do
      board.make_move(5, 'x')
      expect(board.current_state).to eq([1,2,3,4,'x',6,7,8,9])
      expect(board.number_of_empty_positions).to eq(8)
    end
  end

  context "detecting winning combinations" do
    context "horizontal wins" do
      it "detects first winning combination" do
        helper.fill_board(board, [1,2,3], %w[x x x])
        expect(board).to be_is_horizontal_win
      end

      it "detects second winning combination" do
        helper.fill_board(board, [4,5,6], %w[x x x])
        expect(board).to be_is_horizontal_win
      end

      it "detects third winning combination" do
        helper.fill_board(board, [7,8,9], %w[x x x])
        expect(board).to be_is_horizontal_win
      end
    end

    context "vertical wins" do
      it "detects first winning combination" do
        helper.fill_board(board, [1,4,7], %w[x x x])
        expect(board).to be_is_vertical_win
      end

      it "detects second winning combination" do
        helper.fill_board(board, [2,5,8], %w[x x x])
        expect(board).to be_is_vertical_win
      end

      it "detects third winning combination" do
        helper.fill_board(board, [3,6,9], %w[x x x])
        expect(board).to be_is_vertical_win
      end
    end

    context "diagonal wins" do
      it "detects first winning combination" do
        helper.fill_board(board, [1,5,9], %w[x x x])
        expect(board).to be_is_diagonal_win
      end

      it "detects second winning combination" do
        helper.fill_board(board, [3,5,7], %w[x x x])
        expect(board).to be_is_diagonal_win
      end
    end
  end

  context "detects win on the board" do
    it "board has winner" do
      helper.fill_board(board, [3,5,7], %w[x x x])
      expect(board).to be_has_winner
    end

    it "board has no winner" do
      helper.fill_board(board, [3,5,7], %w[x o x])
      expect(board).not_to be_has_winner
    end
  end
end


