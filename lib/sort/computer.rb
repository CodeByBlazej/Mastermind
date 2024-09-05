require_relative 'colors'

class Computer
  attr_accessor :name, :selected_colors

  def initialize (name)
    @name = name
  end

  
  def pick_colors(colors)
    @selected_colors = colors.sample(4)
  end
end