class Symbols
  attr_reader :ai, :human

  def initialize(ai_symbol, human_symbol)
    @ai = ai_symbol
    @human = human_symbol
  end

  def switch(symbol)
    symbol == @ai ? @human : @ai
  end

  def get_all
    [@ai, @human]
  end
end