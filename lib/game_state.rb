class GameState

  attr_accessor :board

  def initialize(board)
    @board =  board
  end

  def is_board_full?
    if @board.spaces.select { |key, value| value == ""  }.values.include?("")
      return false
    else
      return true
    end
  end

  def is_a_tie?
    if is_board_full?
      if not is_winner_declared?
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def is_winner_declared?
    if is_winner?("x")
      return true
    elsif is_winner?("o")
      return true
    else
      return false
    end
  end

  def is_winner?(token)
    (0...@board.board_size).each do |i|
      if @board.rows[i].uniq == [token]
        return true
      elsif @board.columns[i].uniq == [token]
        return true
      end
    end

    if @board.left_diagonal.uniq == [token]
      return true
    elsif @board.right_diagonal.uniq == [token]
      return true
    else
      return false
    end
  end

  def rows_have_a_winner?
     @rows = @board.spaces.values.each_slice(@board.board_size)
     (0...@rows).each do |i|
       if @rows[i].uniq.length == 1 && @rows[i].uniq != [""]
         return true
       else
         return false
       end
     end
   end

end

