require_relative 'colors'
require_relative 'board'
require_relative 'player'


class Computer
  attr_accessor :name, :code, :guessed_code

  def initialize (name)
    @name = name
  end

  def make_a_code(all_colors)
    @code = all_colors.sample(4)
  end
  
  def guess(all_colors)
    @guessed_code = all_colors.sample(4)
    # @guessed_code.sample(4)
  end

  def check_for_hints(white_pin, red_pin)
    
  end

end