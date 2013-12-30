$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

require "player_finder"
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
    create_players
  end

  def create_players
    player_selection = @ui.get_input("How many players (1 or 2) ?").to_i
    if player_selection == 1
      PlayerFinder.find(1)
    elsif player_selection == 2
      PlayerFinder.find(2, "HumanPlayer")
    else
      create_players
    end
  end

end

if __FILE__ == $0
  run = Run.new
end
