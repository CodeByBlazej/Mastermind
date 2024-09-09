require_relative 'sort/board'
require_relative 'sort/colors'
require_relative 'sort/computer'
require_relative 'sort/player'
require_relative 'sort/pins'

board = Board.new
white_pin = Pin.new("white", "W")
red_pin = Pin.new("red", "R")

red_ball = Colors.new("red", "X")
green_ball = Colors.new("green", "X")
yellow_ball = Colors.new("yellow", "X")
blue_ball = Colors.new("blue", "X")
purple_ball = Colors.new("magenta", "X")
cyan_ball = Colors.new("cyan", "X")
white_ball = Colors.new("white", "X")
grey_ball = Colors.new("grey", "X")

# board.display_board(computer)
white_pin.show_me
red_pin.show_me
puts red_ball.symbol
puts yellow_ball.symbol

# starts the game 

puts "Let's start the game... What is your name?"
player_name = gets.chomp

player = Player.new(player_name)

puts "Computer is going to make a code now..."
# Think later when to move all_colors. I think it looks misplaced here
all_colors = [red_ball, green_ball, yellow_ball, blue_ball,
purple_ball, cyan_ball, white_ball, grey_ball]

computer = Computer.new("computer")
computer.make_a_code(all_colors)

computer.code

board.hidden_row = computer.code 

board.display_board(computer)

puts "Guess the code by putting each peg in every hole. 
To do it type: "
computer.guess
board.guess_row = computer.guessed_code
board.display_board(computer)
computer.show_available_colors(all_colors)

# computer.selected_colors.map { |color| p color}
# computer.guess(@selected_colors)
# p computer.guessed_code
# p computer.code
# p computer.selected_colors
# board.guess_row = player.guessed_code


