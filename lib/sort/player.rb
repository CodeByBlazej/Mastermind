# Player class responsible for making code if player is CODE MAKER,
# guessing code if player is CODE GUESSER and checking for correct input
class Player
  attr_accessor :name, :guessed_code, :code, :player_hint_row

  def initialize(name)
    @name = name
  end

  def guess(all_colors)
    @guessed_code = Array.new(4) do
      guess_input = gets.chomp.downcase
      all_colors.find { |color| color.color_name == guess_input }
    end

    return unless @guessed_code.include?(nil)

    puts "Try again, make sure all color names are written correctly"
    guess(all_colors)
  end

  def make_a_code(all_colors)
    @code = Array.new(4) do
      code_input = gets.chomp.downcase
      all_colors.find { |color| color.color_name == code_input }
    end

    return unless @code.include?(nil)

    puts "Try again, make sure all color names are written correctly"
    make_a_code(all_colors)
  end
end
