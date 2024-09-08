require_relative 'computer'

class Player
  attr_accessor :name, :guessed_code

  def initialize (name)
    @name = name
  end

  def guess(selected_colors)
    @guesed_code = @selected_colors.map { |color| color.color_name == gets.chomp ? color.symbol : "You put wrong name" }
  end

end