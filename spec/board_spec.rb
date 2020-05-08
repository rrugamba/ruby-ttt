require '../ttt/Board'

describe Board do
  context "creating the board, making moves on board" do
    it "creates a 3 x 3 board" do
      board = Board.new(3)
      expect(board.length).to eq(9)
    end

    it "creates 4 x 4 board" do
      board = Board.new(4)
      expect(board.length).to eq(16)
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
  context "detecting winning combinations" do
    context "horizontal wins" do
      it "detects first winning combination" do
        board = Board.new(3)
        board.make_move(0, 'x')
        board.make_move(1, 'x')
        board.make_move(2, 'x')

        expect(board.is_horizontal_win?).to be true
      end

      it "detects second winning combination" do
        board = Board.new(3)
        board.make_move(3, 'x')
        board.make_move(4, 'x')
        board.make_move(5, 'x')

        expect(board.is_horizontal_win?).to be true
      end

      it "detects third winning combination" do
        board = Board.new(3)
        board.make_move(6, 'x')
        board.make_move(7, 'x')
        board.make_move(8, 'x')

        expect(board.is_horizontal_win?).to be true
      end
    end
    context "vertical wins" do
      it "detects first winning combination" do
        board = Board.new(3)
        board.make_move(0, 'x')
        board.make_move(3, 'x')
        board.make_move(6, 'x')

        expect(board.is_vertical_win?).to be true
      end

      it "detects second winning combination" do
        board = Board.new(3)
        board.make_move(1, 'x')
        board.make_move(4, 'x')
        board.make_move(7, 'x')

        expect(board.is_vertical_win?).to be true
      end

      it "detects third winning combination" do
        board = Board.new(3)
        board.make_move(2, 'x')
        board.make_move(5, 'x')
        board.make_move(8, 'x')

        expect(board.is_vertical_win?).to be true
      end
    end
    context "diagonal wins" do
      it "detects first winning combination" do
        board = Board.new(3)
        board.make_move(0, 'x')
        board.make_move(4, 'x')
        board.make_move(8, 'x')

        expect(board.is_diagonal_win?).to be true
      end

      it "detects second winning combination" do
        board = Board.new(3)
        board.make_move(2, 'x')
        board.make_move(4, 'x')
        board.make_move(6, 'x')

        expect(board.is_diagonal_win?).to be true
      end
    end
  end
  context "detects win on the board" do
    it "board has winner" do
      board = Board.new(3)
      board.make_move(2, 'x')
      board.make_move(4, 'x')
      board.make_move(6, 'x')

      expect(board.has_winner?).to be true
    end

    it "board has no winner" do
      board = Board.new(3)
      board.make_move(2, 'x')
      board.make_move(4, 'o')
      board.make_move(6, 'x')

      expect(board.has_winner?).to be false
    end
  end
end


