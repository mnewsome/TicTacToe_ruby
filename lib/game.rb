require './board'
require './ui'

class Game

  def initialize(board, ui)
    @board = board
    @ui = ui
  end

  def start_new_game(welcome_message)
    @ui.print_message(welcome_message)
    @ui.print_board(@board.rows)
  end

end

if __FILE__ == $0
  game = Game.new(Board.new(9), UI.new)
  game.start_new_game("Welcome to Tic Tac Toe")

end
