require_relative 'colors'
require_relative 'board'
require_relative 'player'


class Computer
  attr_accessor :name, :selected_colors, :code, :guessed_code

  def initialize (name)
    @name = name
    @selected_colors = []
  end

  
  def pick_colors(colors)
    @selected_colors = colors.sample(4)
  end

  def make_a_code
    @code = @selected_colors.sample(4)
  end

  def show_selected_colors
    @selected_colors.each do |color|
      colorized_name = color.color_name.colorize(color.color_name.to_sym)
      puts "#{color.symbol} - #{colorized_name}"
    end
  end

  def guess
    @guessed_code = Array.new(4) do
      guess_input = gets.chomp.downcase
      @selected_colors.find { |color| color.color_name == guess_input}
    end
  end
  
end