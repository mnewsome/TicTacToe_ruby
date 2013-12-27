$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

require "tic_tac_toe_board"
require "user_interface"

class Run

  def initialize
    @ui = UserInterface.new
    @ttt_board = TicTacToeBoard.new(9)
    start_new_game
  end

  def start_new_game
    @ui.print_message("Welcome to Tic Tac Toe")
    @ui.print_board(@ttt_board.rows)
  end


end

if __FILE__ == $0
  run = Run.new
end
