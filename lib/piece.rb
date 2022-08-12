module Piece
  def allowable_move?(x, y)
    x > 0 && x < 9 && y > 0 && y < 9
  end
end
