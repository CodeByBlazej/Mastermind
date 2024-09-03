require_relative 'sort/board'
require_relative 'sort/colors'
require_relative 'sort/computer'
require_relative 'sort/player'
require_relative 'sort/pins'

board = Board.new
white_pin = Pin.new("white")
red_pin = Pin.new("red")

board.display_board
white_pin.show_me
red_pin.show_me
