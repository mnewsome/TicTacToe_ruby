require "board"

class TicTacToeBoard < Board

  X_MARK = "x"
  O_MARK = "o"

  def rows
    @spaces.each_slice(depth).to_a
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

  def winner
    winner_on_row || winner_on_column || winner_on_diagonal
  end

  def tie?
    board_full? && winner.nil?
  end

  def game_over?
    (tie? || winner == X_MARK || winner == O_MARK)
  end

  def is_mark_valid?(mark)
    mark == X_MARK || mark == O_MARK
  end

  def next_player_mark
    if number_of_empty_spaces.even?
      return O_MARK
    else
      return X_MARK
    end
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

  def board_full?
    @spaces.all? { |space| space.is_a? String }  && winner == nil
  end

  def number_of_empty_spaces
    @spaces.count { |space| space.is_a? Fixnum }
  end
end
