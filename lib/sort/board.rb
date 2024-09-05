require_relative 'computer'

class Board
  attr_accessor :hidden_row, :guess_row, :hint_row

  def initialize 
    @hidden_row = Array.new(4)
    @guess_row = Array.new(4)
    @hint_row = Array.new(2) { Array.new(2) }
  end


  def display_board
    p @hidden_row
    p @guess_row
    p @hint_row[0]
    p @hint_row[1]
  end
end
