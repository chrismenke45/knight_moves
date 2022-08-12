require "./lib/board.rb"
require "./lib/knight.rb"

board = Board.new
board.show_board
kni = Knight.new
kni.moves_to_space([1, 1], [1, 1])
