require 'colorize'
require_relative 'computer'
require_relative 'colors'

class Board
  attr_accessor :hidden_row, :guess_row, :hint_row, :aval_colors

  def initialize
    @hidden_row = Array.new(4)
    @guess_row = Array.new(4)
    @hint_row = Array.new(4) 
    # { Array.new(2) }
  end

  def show_available_colors(all_colors)
    @aval_colors = all_colors.map do |color|
      color.color_name.colorize(color.color_name.to_sym)
    end
    puts aval_colors.join(' ')
  end

  def display_board(all_colors)
    puts "-------"
    puts "Colors available in this game are:
    \n"
    show_available_colors(all_colors)
    # show_available_colors(all_colors)
    # puts "Colors in this game are: #{all_colors}"

    arr1 = @hidden_row.map { |color| color.nil? ? "[0]" : "[#{color.symbol}]" }
    
    arr2 = @guess_row.map { |color| color.nil? ? "[0]" : "[#{color.symbol}]" }
    arr3 = @hint_row.map { |color| color.nil? ? "[0]" : "[#{color.color_symbol}]"}
    # arr4 = @hint_row[1].map { |color| color.nil? ? "[0]" : "[#{color.color_symbol}]"}
    
    puts "\nHIDDEN ROW FOR NOW"
    puts arr1.join(' ')
    puts "HIDDEN ROW FOR NOW"

    puts arr2.join(' ')

    puts "Pins are:"
    puts arr3.join(' ')
    # puts arr4.join(' ')
  end

  def check_for_hints(white_pin)
    intersection = @hidden_row & @guess_row
    if !intersection.empty?
      pins = intersection.map { |match| match.color_name = white_pin}
      @hint_row = pins
      # @hint_row = intersection

    else @hint_row
    end
    # @hint_row = @guess_row.intersection(@hidden_row)
  end

end 
