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

  def play_round(board, all_colors, white_pin, red_pin)
    round = (1..12)
    round.each do |round|

      self.guess(all_colors)
      board.guess_row = @guessed_code
      board.check_for_hints(white_pin, red_pin)
      board.display_board(all_colors)
      puts "Guess the code by putting each peg in every hole. 
      To do it type name of the color: "
      # binding.pry
      if board.hint_row.all?(red_pin)
        puts "#{@name} WON!"
        break
      end
    end
  end
end