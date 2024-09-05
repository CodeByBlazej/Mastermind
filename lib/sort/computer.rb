require_relative 'colors'

class Computer
  attr_accessor :name, :selected_colors, :code

  def initialize (name)
    @name = name
  end

  
  def pick_colors(colors)
    @selected_colors = colors.sample(4)
  end

  def make_a_code(selected_colors)
    @code = @selected_colors.sample(4)
  end
end