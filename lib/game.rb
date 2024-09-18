require 'pry-byebug'
require_relative 'sort/board'
require_relative 'sort/colors'
require_relative 'sort/computer'
require_relative 'sort/player'
require_relative 'sort/pins'

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
  end

  def play_guesser_round
    until @round_number == 12 do
      @player.guess(@all_colors)
      @board.guess_row = @player.guessed_code
      @board.player_check_for_hints(@white_pin, @red_pin)
      puts "\nIt's round number: #{@round_number += 1}"
      @board.display_board(@all_colors)
      
      if @board.hint_row.all?(@red_pin)
        puts "\nGame over! #{@player_name} wins in round #{@round_number}!"
        break
      end
      puts "\nGuess the code by putting each peg in every hole. \nTo do it type name of the color: "
    end
  end

  def computer_guesser_round
    @computer.guess(@all_colors)
    @board.guess_row = @computer.guessed_code
    @board.display_board(@all_colors)
    @player.check_for_hints(@white_pin, @red_pin)
    @board.hint_row = @player.player_hint_row
    @board.display_board(@all_colors)
    @board.computer_check_for_hints(@white_pin, @red_pin)
  end
    
  def start
    puts "Welcome to Mastermind! What is your name?"
    @player_name = gets.chomp
    puts "Thanks! Do you want to be code maker or code guesser? \nType MAKER or GUESSER"
    @selection = gets.chomp.downcase
    
    if @selection == "guesser"
      puts "Thanks! Computer is going to make a code now..."
      @computer.make_a_code(@all_colors)
      @board.hidden_row = @computer.code 
      puts "\nIt's round number: #{@round_number}"
      @board.display_board(@all_colors)
      puts "\nGuess the code by putting each peg in every hole. \nTo do it type name of the color: "
      play_guesser_round
    end

    if @selection == "maker"
      puts "Thanks! Make a code from available colors..."
      @board.show_available_colors(@all_colors)
      @player.make_a_code(@all_colors)
      @board.hidden_row = @player.code
      puts "\nIt's round number: #{@round_number}"
      @board.display_board(@all_colors)
      puts "Computer is guessing now..."
      computer_guesser_round
    end
  end

end

game = Game.new
game.start

# first thing tomorrow - finish computer guess method and carry on with computer guesser round