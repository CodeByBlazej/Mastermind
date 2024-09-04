require 'colorize'
require_relative 'computer'

class Colors
  attr_accessor :color, :symbol

  def initialize (color_name, symbol)
    @color = color_name.colorize(color_name.to_sym) 
    @symbol = symbol.colorize(color_name.to_sym)
  end
end