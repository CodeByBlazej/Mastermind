# Computer class responsible for making code if computer is CODE MAKER,
# and guessing if computer is CODE GUESSER

class Computer
  attr_accessor :name, :code, :guessed_code

  def initialize (name)
    @name = name
  end

  def make_a_code(all_colors)
    @code = all_colors.sample(4)
  end
  
  def guess(all_colors)
    @guessed_code = all_colors.sample(4)
  end

  def guess_smart(all_colors, possible_current_colors)
    number_of_possible_colors = possible_current_colors.count
    other_possible_colors = all_colors - possible_current_colors

    @guessed_code = possible_current_colors + other_possible_colors.sample(4 - number_of_possible_colors)
  end
end