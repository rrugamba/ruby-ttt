require_relative 'player'
require_relative 'get'

module Core

  class Human

    def move_strategy(input_source)
      input_source.get_move
    end
    
  end

end
