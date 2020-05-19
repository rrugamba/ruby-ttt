require '../../ttt/core/Ai'

describe Core::Ai do
  context "creates a player" do
    it "an ai player" do
      player = Core::Ai.new
      expect(player).to be_instance_of(Core::Ai)
    end
  end
end
