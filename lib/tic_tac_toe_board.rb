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
    (0...3).each do |i|
      if rows[i].uniq.length == 1
        return rows[i].uniq[0]
      elsif columns[i].uniq.length == 1
        return columns[i].uniq[0]
      end
    end

    if left_diagonal.uniq.length == 1
      return left_diagonal.uniq[0]
    elsif right_diagonal.uniq.length == 1
      return right_diagonal.uniq[0]
    end
  end

  def tie?
    true
  end

end
