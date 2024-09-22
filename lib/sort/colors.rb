# Colors class is responsible for colorizing all colors avaiable in the game

class Colors
  attr_accessor :color_name, :symbol

  def initialize (color_name, symbol)
    @color_name = color_name
    @symbol = symbol.colorize(color_name.to_sym)
  end
end

