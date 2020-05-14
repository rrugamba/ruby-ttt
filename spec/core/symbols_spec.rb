require '../../ttt/core/Symbols'

describe Symbols do
  context "switches players" do
    it "from symbol x to symbol o" do
      symbols = Symbols.new('x','o')
      expect(symbols.switch('x')).to eq('o')
    end

    it "from symbol o to symbol x" do
      symbols = Symbols.new('x','o')
      expect(symbols.switch('o')).to eq('x')
    end
  end

  context "get symbols" do
    it "gets all symbols " do
      symbols = Symbols.new('x', 'o')
      expect(symbols.get_all).to eq(%w[x o])
    end

    it "gets ai symbol" do
      symbols = Symbols.new('x', 'o')
      expect(symbols.ai).to eq('x')
    end

    it "gets human symbol" do
      symbols = Symbols.new('x', 'o')
      expect(symbols.human).to eq('o')
    end
  end
end