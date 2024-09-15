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
  end

  def play_round
    12.times do
      @player.guess(@all_colors)
      @board.guess_row = @player.guessed_code
      @board.check_for_hints(@white_pin, @red_pin)
      @board.display_board(@all_colors)
      
      if @board.hint_row.all?(@red_pin)
        puts "Game over! #{@player_name} wins!"
        break
      end
      puts "\nGuess the code by putting each peg in every hole. \nTo do it type name of the color: "
    end
  end
    
  def start
    puts "Welcome to Mastermind! What is your name?"
    @player_name = gets.chomp
    puts "Thanks! Computer is going to make a code now..."
    @computer.make_a_code(@all_colors)
    @board.hidden_row = @computer.code 
    @board.display_board(@all_colors)
    puts "\nGuess the code by putting each peg in every hole. \nTo do it type name of the color: "
    play_round
  end

end

game = Game.new
game.start

# first thing tomorrow - make counter for rounds and if player won and refactor game file to make it a class