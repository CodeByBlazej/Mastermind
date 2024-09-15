require_relative 'computer'
require_relative 'board'

class Player
  attr_accessor :name, :guessed_code

  def initialize (name)
    @name = name
  end

  def guess(all_colors)
    @guessed_code = Array.new(4) do
      guess_input = gets.chomp.downcase
      all_colors.find { |color| color.color_name == guess_input}
    end
  end

end