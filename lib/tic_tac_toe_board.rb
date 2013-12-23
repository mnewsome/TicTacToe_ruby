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

end
