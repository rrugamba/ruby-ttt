require '../../ttt/core/Ai'

describe Ai do
  context "creates a player" do
    it "creates a player" do
      player = Ai.new
      expect(player).to be_instance_of(Ai)
    end
  end
end
