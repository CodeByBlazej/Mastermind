require 'colorize'
class Colors
  attr_accessor :color

  def initialize (color_name)
    @color = color_name.colorize(color_name.to_sym) 
  end
end