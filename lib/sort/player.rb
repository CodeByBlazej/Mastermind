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

  # def check_for_hints(white_pin, red_pin)
  #   hints = Array.new(4) do
  #     user_input = nil
      
  #     until (user_input == white_pin.color || user_input == red_pin.color || user_input == '0' )
  #       puts "Please type color white for a match but in the wrong place,\nred for a match in the same place or 0 for no matches..."        
  #       user_input = gets.chomp.downcase
  #     end
    
  #     if user_input == white_pin.color
  #       white_pin
  #     elsif user_input == red_pin.color
  #       red_pin
  #     else
  #       nil
  #     end  
  #   end
  #   @player_hint_row = hints
  # end
end