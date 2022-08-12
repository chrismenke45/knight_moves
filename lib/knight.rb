require "./lib/piece.rb"

class Knight
  include Piece

  attr_reader :x, :y

  def initialize
    @x = 1
    @y = 1
  end

  def move_options(current_x, current_y)
    opt1 = [current_x + 2, current_y + 1]
    opt2 = [current_x + 2, current_y - 1]
    opt3 = [current_x - 2, current_y + 1]
    opt4 = [current_x - 2, current_y - 1]
    opt5 = [current_x + 1, current_y + 2]
    opt6 = [current_x + 1, current_y - 2]
    opt7 = [current_x - 1, current_y + 2]
    opt8 = [current_x - 1, current_y - 2]
    options = [opt1, opt2, opt3, opt4, opt5, opt6, opt7, opt8]
    valid_options = []
    options.each { |option| valid_options.push(option) if allowable_move?(option[0], option[1]) }
    valid_options.uniq
  end

  def move_count_to_space(current_x_y, destination_x_y, iteration_count = 0)
    possible_moves = move_options(current_x_y[0], current_x_y[1])
    return_array = []
    possible_moves.each do |move|
      return 1 if move == destination_x_y
      return false if iteration_count > 5
      return_array.push(move_count_to_space(move, destination_x_y, iteration_count + 1) ? move_count_to_space(move, destination_x_y, iteration_count + 1) + 1 : false)
    end
    return_array.delete(false)
    return_array.empty? ? false : return_array.min
  end

  def move_count_to_space_a(current_x, current_y, destination_x, destination_y, iteration_count = 0)
    possible_moves = move_options(current_x, current_y)
    return_array = []
    possible_moves.each do |move|
      return 1 if move == [destination_x, destination_y]
      return false if iteration_count > 5
      return_array.push(move_count_to_space_a(move[0], move[1], destination_x, destination_y, iteration_count + 1) ? move_count_to_space_a(move[0], move[1], destination_x, destination_y, iteration_count + 1) + 1 : false)
    end
    return_array.delete(false)
    return_array.empty? ? false : return_array.min
  end

  def move_count_to_space2(current_x_y, destination_x_y, visited_spaces = [current_x_y])
    p visited_spaces
    possible_moves = move_options(current_x_y[0], current_x_y[1])
    return_array = []
    possible_moves.each do |move|
      return 1 if move == destination_x_y
      return false if visited_spaces.include?(move) && visited_spaces.length > 1
      return_array.push(move_count_to_space2(move, destination_x_y, visited_spaces + [move]) ? (move_count_to_space2(move, destination_x_y, visited_spaces + [move]) + 1) : false)
    end
    return_array.delete(false)
    return_array.empty? ? false : return_array.min
  end

  def move_count_to_space3(current_x_y, destination_x_y, visited_spaces = [current_x_y])
    #p visited_spaces
    possible_moves = move_options(current_x_y[0], current_x_y[1])
    return_array = []
    possible_moves.each do |move|
      return 1 if move == destination_x_y
      next if visited_spaces.include?(move) && visited_spaces.length > 1 || visited_spaces.length > 6
      return_array.push(move_count_to_space3(move, destination_x_y, visited_spaces + [move]) ? (move_count_to_space3(move, destination_x_y, visited_spaces + [move]) + 1) : false)
    end
    return_array.delete(false)
    return_array.empty? ? false : return_array.min
  end
end
