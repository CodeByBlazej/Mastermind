require_relative 'colors'
require_relative 'board'
require_relative 'player'


class Computer
  attr_accessor :name, :code, :guessed_code, :aval_colors

  def initialize (name)
    @name = name
  end

  def make_a_code(all_colors)
    @code = all_colors.sample(4)
  end

  def show_available_colors(all_colors)
    @aval_colors = all_colors.each do |color|
      colorized_name = color.color_name.colorize(color.color_name.to_sym)
      puts "[#{color.symbol} - #{colorized_name}]"
    end
  end

  def guess
    @guessed_code = Array.new(4) do
      guess_input = gets.chomp.downcase
      @code.find { |color| color.color_name == guess_input}
    end
  end
  
end