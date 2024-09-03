require_relative 'sort/board'
require_relative 'sort/colors'
require_relative 'sort/computer'
require_relative 'sort/player'
require_relative 'sort/pins'

board = Board.new
white_pin = Pin.new("white")
red_pin = Pin.new("red")

red_ball = Colors.new("red", "X")

board.display_board
white_pin.show_me
red_pin.show_me
puts red_ball.symbol
