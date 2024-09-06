require_relative 'computer'
require_relative 'colors'

class Board
  attr_accessor :hidden_row, :guess_row, :hint_row

  def initialize
    @hidden_row = Array.new(4)
    @guess_row = Array.new(4)
    @hint_row = Array.new(2) { Array.new(2) }
  end


  def display_board
    puts @hidden_row.map { |color| color.symbol }
    puts @guess_row
    puts @hint_row[0]
    puts @hint_row[1]
  end
end
