class Board
  attr_accessor :spaces, :rows, :columns

  def initialize(number_of_spaces)
    @number_of_spaces = number_of_spaces
    @board_size = Math.sqrt(@number_of_spaces).to_i
    initialize_spaces
  end

  def initialize_spaces
    @spaces = Hash.new
    for i in (1..@number_of_spaces) do
      @spaces[i] = ""
    end
    return @spaces
  end

  def is_board_full?
    @spaces.each do |key, value|
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

  def is_winner_declared?
   rows_have_a_winner?
   #@columns = @rows.transpose
   #array_size = @board_size - 1
   #@left_diagonal = (0..array_size).collect{ |i| @rows[i][i] }
   #@right_diagonal = (0..array_size).collect{ |i| @rows[i][array_size - i] }
  end

  def rows_have_a_winner?
    @rows = @spaces.values.each_slice(@board_size).to_a
    (0...@board_size).each do |i|
      if @rows[i].uniq.length == 1 && @rows[i].uniq != ""
        return true
      else
        return false
      end
    end
  end
end

