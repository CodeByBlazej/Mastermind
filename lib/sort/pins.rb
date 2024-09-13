require 'colorize'

class Pin
  attr_accessor :color, :color_symbol

  def initialize (color, color_symbol)
    @color = color
    @color_symbol = color_symbol.colorize(color.to_sym)
  end

  def show_me
    puts "I am #{@color_symbol}"
  end
end