require_relative 'computer'
require_relative 'board'

class Player
  attr_accessor :name, :guessed_code, :code, :player_hint_row

  def initialize (name)
    @name = name
  end

  def guess(all_colors)
    @guessed_code = Array.new(4) do
      guess_input = gets.chomp.downcase
      all_colors.find { |color| color.color_name == guess_input }
    end
  end

  def make_a_code(all_colors)
    @code = Array.new(4) do
      code_input = gets.chomp.downcase
      all_colors.find { |color| color.color_name == code_input }
      
    end

    if @code.include?(nil)
      puts "Try again, make sure all color names are written correctly"
      make_a_code(all_colors)
    end
  end

  def check_for_hints(white_pin, red_pin)
    hints = Array.new(4)

      until hints.length == 4 && hints.include?(user_input) do
        puts "Please type color white, red or 0 for no matches..."
        user_input = gets.chomp.downcase
      end

      if user_input == white_pin.color
        
      end
        gets.chomp.downcase == white_pin.color || gets.chomp.downcase == red_pin.color || gets.chomp.downcase == '0' do
      end
      @player_hint_row = hints
    end
  end

end