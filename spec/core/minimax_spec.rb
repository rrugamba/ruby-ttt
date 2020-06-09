require './helpers/Helper'
require '../../ttt/core/Minimax'
require '../../ttt/core/Board'
require '../../ttt/core/Ai'
require '../../ttt/core/Symbols'

describe Core::Minimax do
  let(:helper) { Helper.new }
  let(:player) { Core::Ai.new }
  let(:symbols) { Core::Symbols.new('x', 'o') }

  before(:each) do
    @board = Core::Board.new(3)
  end

  context "makes winning move" do
    # x o x
    # o x o
    # o x -
    it "one spot left " do
      @board =  helper.fill_board(@board, [1,2,3,4,5,6,7,8], %w[x o x o x o o x])
      best_move =  player.move_strategy(@board,  symbols)

      expect(best_move).to eq(8)
    end

    # x o o
    # o x -
    # x o -
    it "two spots left" do
      @board =  helper.fill_board(@board, [1,2,3,4,5,7,8], %w[x o o o x x o])
      best_move =  player.move_strategy(@board,  symbols)

      expect(best_move).to eq(8)
    end

    # o x -
    # o x -
    # - - -
    it "makes winning move instead of blocking" do
      @board =  helper.fill_board(@board, [1,2,4,5], %w[o x o x])
      best_move =  player.move_strategy(@board,  symbols)

      expect(best_move).to eq(7)
    end
  end

  context "makes blocking moves" do
    # o x o
    # o x -
    # - o x
    it "1st blocking " do
      @board =  helper.fill_board(@board, [1,2,3,4,5,8,9], %w[o x o o x o x])
      best_move =  player.move_strategy(@board,  symbols)

      expect(best_move).to eq(6)
    end

    # o x -
    # o x -
    # - o -
    it "2nd blocking" do
      @board =  helper.fill_board(@board, [1,2,4,5,8], %w[o x o x o])
      best_move =  player.move_strategy(@board,  symbols)

      expect(best_move).to eq(6)
    end

    # o o -
    # o x -
    # - x -
    it "3rd blocking " do
      @board =  helper.fill_board(@board, [1,2,4,5,7,8], %w[o o o x x])
      best_move =  player.move_strategy(@board,  symbols)

      expect(best_move).to eq(2)
    end

    # o - x
    # x - -
    # x o o
    it "4th blocking " do
      @board =  helper.fill_board(@board, [1,3,4,7,8,9], %w[o x x x o o])
      best_move =  player.move_strategy(@board,  symbols)

      expect(best_move).to eq(4)
    end

    # o - -
    # x o -
    # - - -
    it "5th blocking " do
      @board =  helper.fill_board(@board, [1,4,5], %w[o x o])
      best_move =  player.move_strategy(@board,  symbols)

      expect(best_move).to eq(8)
    end

    # o x x
    # x o -
    # - o -
    it "6th blocking " do
      @board = helper.fill_board(@board, [1,2,3,4,5,8], %w[o x x x o o])
      best_move = player.move_strategy(@board, symbols)
      expect(best_move).to eq(8)
    end

    # x - o
    # - o -
    # - - -
    it "7th blocking " do
      @board = helper.fill_board(@board, [1,3,5], %w[x o o])
      best_move = player.move_strategy(@board, symbols)
      expect(best_move).to eq(6)
    end
    
  end

end