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
    @guessed_code = Array.new(4) do
      guess_input = gets.chomp.downcase
      all_colors.find { |color| color.color_name == guess_input}
    end
  end
  
end