require "board"

class TicTacToeBoard < Board

  def initialize(size)
    @spaces = (1..size).to_a
  end

  def rows
    @spaces.each_slice(3).to_a
  end

  def columns
    rows.transpose
  end

  def left_diagonal
    (0...rows[0].size).collect { |i| rows[i][i]}
  end

  def right_diagonal
    (0...rows[0].size).collect { |i| rows[i][2 - i] }
  end

  def fill_space_at(space, value)
    array_index = space - 1
    if get_value_at(space) == space
      @spaces[space - 1] = value
    else
      raise ArgumentError.new( "Space not available" )
    end
  end

end
