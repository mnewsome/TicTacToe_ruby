class ComputerPlayer

  attr_reader :name, :mark, :move

  def set_name(name)
    @name = name
  end

  def set_mark(mark)
    @mark = mark
  end

  def set_move(move)
    @move = move
  end

  def get_best_move(board, depth=0, best_score={})
    return 0 if board.tie?
    return -1 if board.game_over?

    board.available_spaces.each do |space|
      board.fill_space_at(space, board.next_player_mark)
      best_score[space] = -1 * get_best_move(board, depth + 1, {})
      board.reset_space_at(space)
    end

    best_move = best_score.max_by { |key, value| value }[0]
    highest_minimax_score = best_score.max_by { |key, value| value }[1]

    if depth == 0
      return best_move
    elsif depth > 0
      return highest_minimax_score
    end
  end

end
