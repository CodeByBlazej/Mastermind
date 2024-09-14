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

  def check_for_hints(white_pin, red_pin)
    hidden_clone = @hidden_row.clone
    guess_clone = @guess_row.clone
    hints = Array.new(4)

    guess_clone.each_with_index do |guess_color, index|

      if guess_color && hidden_clone[index] && guess_color.color_name == hidden_clone[index].color_name
        hints[index] = red_pin
        hidden_clone[index] = nil
        guess_clone[index] = nil
      end
    end

    guess_clone.each_with_index do |guess_color, index|
      next if guess_color.nil?

      if hidden_clone.any? { |hidden_color| hidden_color&.color_name == guess_color.color_name }
        hints[index] = white_pin
        hidden_clone[hidden_clone.index { |hidden_color| hidden_color&.color_name == guess_color.color_name} ] = nil
      end
    end

    @hint_row = hints.sample(4)
  end
end 
