module Console

  class Collect
    attr_accessor :symbols
    def welcome
      puts "Welcome to TicTacToe"
    end

    def prompt_symbols
      puts "symbol for human"
      human_symbol = gets.delete!("\n")

      puts "symbol for ai"
      ai_symbol = gets.delete!("\n")

      @symbols = [ai_symbol, human_symbol]
    end

    def set_first_player
      answer = who_plays_first
      if answer.chomp.eql?('Y')
        return @symbols.last
      end
      return @symbols.first
    end

    def who_plays_first
      puts "who plays first?"
      puts "human? (Y/N)"
      gets
    end
  end

end