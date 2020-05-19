require './fakes/Input'
require './helpers/helper'
require '../../ttt/core/Human'
require '../../ttt/core/Board'

describe Core::Human do
  let(:helper) { Helper.new }
  let(:board) { Core::Board.new(3) }
  let(:player) { Core::Human.new }

  context "creates a player" do
    it "a human player" do
      expect(player).to be_instance_of(Core::Human)
    end
  end

  context "validates on empty board position" do
    it "get_move returns valid move to make" do
      fakeInputSource = Input.new(1)
      move = player.move_strategy(fakeInputSource)
      expect(board).to be_is_empty_position(move)
    end

    it "get_move returns invalid move to make" do
      helper.fill_board(board, [1], ['x'])
      fakeInputSource = Input.new(1)
      move = player.move_strategy(fakeInputSource)
      expect(board).not_to be_is_empty_position(move)
    end
  end

  context "validates on range of board" do
    it "get_move returns position below 0" do
      fakeInputSource = Input.new(-1)
      move = player.move_strategy(fakeInputSource)
      expect(board).to be_is_out_of_range(move)
    end

    it "get_move returns position greater than board length" do
      fakeInputSource = Input.new(11)
      move = player.move_strategy(fakeInputSource)
      expect(board).to be_is_out_of_range(move)
    end
  end
end
