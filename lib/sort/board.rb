# Board class responsible for making and displaying board, available colors,
# computer and player checking hints so they can select correct pins and finally
# making pins
class Board
  attr_accessor :hidden_row, :guess_row, :hint_row, :aval_colors, :possible_current_colors, :player_selected_pins

  def initialize
    @hidden_row = Array.new(4)
    @guess_row = Array.new(4)
    @hint_row = Array.new(4)
    @possible_current_colors = nil
  end

  def show_available_colors(all_colors)
    @aval_colors = all_colors.map do |color|
      color.color_name.colorize(color.color_name.to_sym)
    end
    puts aval_colors.join(" ")
  end

  def display_board(all_colors, maker = false)
    puts "-------"
    puts "Colors available in this game are:
    \n"
    show_available_colors(all_colors)

    arr1 = @hidden_row.map { |color| color.nil? ? "[0]" : "[#{color.symbol}]" }
    arr2 = @guess_row.map { |color| color.nil? ? "[0]" : "[#{color.symbol}]" }
    arr3 = @hint_row.map { |color| color.nil? ? "[0]" : "[#{color.color_symbol}]" }

    if maker == true
      puts "\nYOUR CODE - HIDDEN:"
      puts arr1.join(" ")
      puts "COMPUTER GUESS:"
    else
      puts "\nYOUR GUESS:"
    end

    puts arr2.join(" ")

    puts "PINS:"
    puts arr3.join(" ")
  end

  def computer_check_hints(white_pin, red_pin)
    guess_clone = @guess_row.clone
    hint_clone = @hint_row.clone
    number_of_whites = hint_clone.count(white_pin)
    number_of_reds = hint_clone.count(red_pin)

    @possible_current_colors = guess_clone.sample(number_of_whites) + guess_clone.sample(number_of_reds)
  end

  def player_check_hints(white_pin, red_pin)
    hidden_clone = @hidden_row.clone
    guess_clone = @guess_row.clone
    hints = Array.new(4)

    guess_clone.each_with_index do |guess_color, index|
      next unless guess_color && hidden_clone[index] && guess_color.color_name == hidden_clone[index].color_name

      hints[index] = red_pin
      hidden_clone[index] = nil
      guess_clone[index] = nil
    end

    guess_clone.each_with_index do |guess_color, index|
      next if guess_color.nil?

      if hidden_clone.any? { |hidden_color| hidden_color&.color_name == guess_color.color_name }
        hints[index] = white_pin
        hidden_clone[hidden_clone.index { |hidden_color| hidden_color&.color_name == guess_color.color_name }] = nil
      end
    end

    @hint_row = hints.sample(4)
  end

  def player_put_the_pins(white_pin, red_pin)
    hints = Array.new(4) do
      user_input = nil

      until user_input == white_pin.color || user_input == red_pin.color || user_input == "0"
        puts "\nPlease type color 'white' for a match but in the wrong place,\n'red' for a match in the same place or '0' for no matches..."
        user_input = gets.chomp.downcase
      end

      if user_input == white_pin.color
        white_pin
      elsif user_input == red_pin.color
        red_pin
      else
        nil
      end
    end
    @player_selected_pins = hints
  end
end
