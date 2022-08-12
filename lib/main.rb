require "./lib/board.rb"
require "./lib/knight.rb"

board = Board.new
board.show_board
kni = Knight.new

def q
  l = [1, 2, 3, 4]
  l.each do |v|
    return "yeehaw" if v == 1
    p v
  end
end

#p q

#p kni.move_options(kni.x, kni.y)
#p kni.move_count_to_space([1, 1], [8, 8])
p kni.move_count_to_space3([1, 1], [8, 8])
