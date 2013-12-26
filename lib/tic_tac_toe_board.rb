require "board"

class TicTacToeBoard < Board

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
    if get_value_at(space) == space
      @spaces[space - 1] = value
    else
      raise ArgumentError.new( "Space not available" )
    end
  end

  def winner
    winner_on_row || winner_on_column || winner_on_diagonal
  end

  def tie?
    true
  end

  private

  def winner_on_row
    (0..2).each do |i|
      return rows[i].first if rows[i].uniq.length == 1
    end
    nil
  end

  def winner_on_column
    (0..2).each do |i|
      return columns[i].first if columns[i].uniq.length == 1
    end
    nil
  end

  def winner_on_diagonal
    if left_diagonal.uniq.length == 1
      return left_diagonal.uniq[0]
    elsif right_diagonal.uniq.length == 1
      return right_diagonal.uniq[0]
    end
  end
end
