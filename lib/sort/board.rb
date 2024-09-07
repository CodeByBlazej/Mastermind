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
    arr2 = @guess_row.map { |color| color.nil? ? "[0]" : "[#{color.symbol}]" }
    arr3 = @hint_row[0].map { |color| color.nil? ? "[0]" : "[#{color.color_symbol}]"}
    arr4 = @hint_row[1].map { |color| color.nil? ? "[0]" : "[#{color.color_symbol}]"}

    puts arr1.join(' ')
    puts arr2.join(' ')
    puts "Pins are:"
    puts arr3.join(' ')
    puts arr4.join(' ')
  end
end 
