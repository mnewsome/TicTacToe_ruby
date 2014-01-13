$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

require "game_sequence"
require "computer_player"
require "human_player"
require "player_finder"
require "tic_tac_toe_board"
require "user_interface"

if __FILE__ == $0
  ttt_board = TicTacToeBoard.new(9)
  player_finder = PlayerFinder
  ui = UserInterface
  game_sequence = GameSequence.new(ttt_board, player_finder, ui)
  game_sequence.start_new_game
end
