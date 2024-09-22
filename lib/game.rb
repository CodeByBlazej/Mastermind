require "pry-byebug"
require "colorize"
require_relative "sort/board"
require_relative "sort/colors"
require_relative "sort/computer"
require_relative "sort/player"
require_relative "sort/pins"

# Game class is responsible for all game mechanics and sarting the game
class Game
  def initialize
    @board = Board.new
    @white_pin = Pin.new("white", "W")
    @red_pin = Pin.new("red", "R")

    @all_colors = [
      Colors.new("red", "X"),
      Colors.new("green", "X"),
      Colors.new("yellow", "X"),
      Colors.new("blue", "X"),
      Colors.new("magenta", "X"),
      Colors.new("cyan", "X"),
      Colors.new("white", "X"),
      Colors.new("grey", "X")
    ]

    @player = Player.new(@player_name)
    @computer = Computer.new("computer")
    @round_number = 1
    @maker = true
  end

  def play_guesser_round
    while @round_number <= 12
      @player.guess(@all_colors)
      @board.guess_row = @player.guessed_code
      @board.player_check_hints(@white_pin, @red_pin)

      @board.display_board(@all_colors)

      if @board.hint_row.all?(@red_pin)
        puts "\nGame over! #{@player_name} wins in round #{@round_number}!"
        break
      end

      @round_number += 1

      if @round_number > 12
        puts "\nGame over! The maximum number of rounds has been reached!"
        break
      end

      puts "\nIt's round number: #{@round_number}"

      puts "\nGuess the code by putting each peg in every hole. \nTo do it type name of the color: "
    end
  end

  def computer_guesser_round
    while @round_number <= 12

      @board.hint_row = @board.hint_row.map { |slot| slot = nil } if @board.hint_row.any?

      if @board.possible_current_colors.nil?
        @computer.guess(@all_colors)
      else
        @computer.guess_smart(@all_colors, @board.possible_current_colors)
      end

      @board.guess_row = @computer.guessed_code
      puts "\nIt's round number: #{@round_number}"
      @board.display_board(@all_colors, @maker)
      @board.player_put_the_pins(@white_pin, @red_pin)
      @board.hint_row = @board.player_selected_pins
      @board.computer_check_hints(@white_pin, @red_pin)
      @board.display_board(@all_colors, @maker)

      if @board.hint_row.all?(@red_pin)
        puts "\nGame over! #{@computer.name} wins in round #{@round_number}!"
        break
      end

      @round_number += 1

      if @round_number > 12
        puts "\nGame over! The maximum number of rounds has been reached!"
        break
      end
    end
  end

  def start
    puts "Welcome to Mastermind! What is your name?"
    @player_name = gets.chomp
    puts "\nThanks! Do you want to be code maker or code guesser? \nType MAKER or GUESSER"
    @selection = gets.chomp.downcase

    if @selection == "guesser"
      puts "\nThanks! Computer is going to make a code now..."
      @computer.make_a_code(@all_colors)
      @board.hidden_row = @computer.code
      puts "\nIt's round number: #{@round_number}"
      @board.display_board(@all_colors)
      puts "\nGuess the code by putting each peg in every hole. \nTo do it type name of the color: "
      play_guesser_round
    end

    return unless @selection == "maker"

    puts "\nThanks! Make a code from available colors..."
    @board.show_available_colors(@all_colors)
    @player.make_a_code(@all_colors)
    @board.hidden_row = @player.code
    @board.display_board(@all_colors, @maker)
    puts "\nComputer is guessing now..."
    computer_guesser_round
  end
end

game = Game.new
game.start
