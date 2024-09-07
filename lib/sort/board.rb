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
    puts "-------"
    arr1 = @hidden_row.map { |color| color.nil? ? "[0]" : "[#{color.symbol}]" }
    puts arr1.join(' ')
    p @guess_row
    p @hint_row[0]
    p @hint_row[1]
  end
end 
