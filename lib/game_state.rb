class GameState

  attr_accessor :board

  def initialize(board)
    @board =  board
  end

  def is_board_full?
    @board.spaces.each do |key, value|
      if value == ""
        return false
      else
        return true
      end
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

  def is_x_winner?
    (0...@board.board_size).each do |i|
      if @board.rows[i].uniq == ["x"]
        return true
      elsif @board.columns[i].uniq == ["x"]
        return true
      end
    end

    if @board.left_diagonal.uniq == ["x"]
      return true
    elsif @board.right_diagonal.uniq == ["x"]
      return true
    else
      return false
    end
  end

   def is_winner_declared?
     @rows = @board.spaces.keys.each_slice(@board.board_size)
     @columns = @board.rows.transpose
     array_size = @board.board_size - 1
     @left_diagonal = (0..array_size).collect{ |i| @rows[i][i] }
     @right_diagonal = (0..array_size).collect{ |i| @rows[i][array_size - i] }
   end

  def rows_have_a_winner?
     @rows = @board.spaces.values.each_slice(@board.board_size)
     (0...@rows).each do |i|
       if @rows[i].uniq == 1
         return true
       else
         return false
       end
     end
   end
end

