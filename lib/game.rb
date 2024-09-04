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
