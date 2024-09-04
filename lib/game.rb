require_relative 'sort/board'
require_relative 'sort/colors'
require_relative 'sort/computer'
require_relative 'sort/player'
require_relative 'sort/pins'

board = Board.new
white_pin = Pin.new("white")
red_pin = Pin.new("red")

red_ball = Colors.new("red", "X")
green_ball = Colors.new("green", "X")
yellow_ball = Colors.new("yellow", "X")
blue_ball = Colors.new("blue", "X")
purple_ball = Colors.new("magenta", "X")
cyan_ball = Colors.new("cyan", "X")
white_ball = Colors.new("white", "X")
grey_ball = Colors.new("grey", "X")

board.display_board
white_pin.show_me
red_pin.show_me
puts red_ball.symbol
puts yellow_ball.symbol

# starts the game 

puts "Let's start the game... What is your name?"
player_name = gets.chomp

player = Player.new(player_name)

puts "Computer is going to pick color of the balls and tell you what they are"

all_colors = [red_ball, green_ball, yellow_ball, blue_ball,
purple_ball, cyan_ball, white_ball, grey_ball]

computer = Computer.new("computer")

puts all_colors.map { |color| color.symbol }

computer.pick_colors(all_colors)

puts computer.selected_colors.each { |color| color.symbol }