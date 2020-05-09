require '../ttt/Human'

describe Human do
  context "creates a player" do
    it "creates a player" do
      player = Human.new
      expect(player).to be_instance_of(Human)
    end
  end
end
