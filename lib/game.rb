require 'board'
require 'ui'

class Game

  attr_accessor :token

  def initialize(board, ui)
    @board = board
    @ui = ui
  end

  def start_new_game(welcome_message)
    @ui.print_message(welcome_message)
    @ui.print_board(@board.board_map)
    instructions
    select_token
  end

  def instructions
    @ui.print_message("Press the number on the key pad that corresponds to the space you'd like.")
  end

  def select_token
   @token = @ui.get_input("First, choose your player token -- 'x' or 'o' ")
   if not is_token_valid?(token)
       select_token
   end
   @token
  end

  def is_token_valid?(token_to_validate)
    if token_to_validate.downcase == "x" || token_to_validate.downcase == "o"
        return true
    else
        return false
    end
  end  

end

if __FILE__ == $0
  game = Game.new(Board.new(9), UI.new)
  game.start_new_game("Welcome to Tic Tac Toe")

end
