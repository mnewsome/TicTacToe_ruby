class Board
  attr_accessor :spaces, :rows, :columns, :board_size, :left_diagonal, :right_diagonal

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

  def rows
    @rows = spaces.values.each_slice(@board_size).to_a
  end

  def columns
    @columns = @rows.transpose
  end

  def left_diagonal
    @left_diagonal = (0...@board_size).collect { |i| @rows[i][i] }
  end

  def right_diagonal
    @right_diagonal = (0...@board_size).collect { |i| @rows[i][(@board_size - 1) - i] }
  end
end

