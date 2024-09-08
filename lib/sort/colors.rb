require 'colorize'
require_relative 'computer'
require_relative 'board'

class Colors
  attr_accessor :color_name, :symbol

  def initialize (color_name, symbol)
    @color_name = color_name
    @symbol = symbol.colorize(color_name.to_sym)
  end
end

