$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

require 'board'
require 'ui'
require 'game_state'
require 'player'

class Game

  attr_accessor :mark, :player1, :player2

  def initialize(board, ui)
    @board = board
    @ui = ui
    @game_state = GameState.new(@board)
  end

  def start_new_game(welcome_message)
    @ui.print_message(welcome_message)
    @ui.print_board(@board.board_map)
    instructions
    create_players
  end

  def instructions
    @ui.print_message("Press the number on the key pad that corresponds to the space you'd like.")
  end

  def create_players
    number_of_players = @ui.get_input("How many players are playing? (1 or 2) ").to_i
    if not is_number_of_players_valid?(number_of_players)
      create_players
    end
    assign_players(number_of_players)
  end

  def is_number_of_players_valid?(number_of_players)
    if number_of_players.to_i == 1 || number_of_players.to_i == 2
      return true
    else
      return false
    end
  end

  def assign_players(number_of_players)
    if number_of_players == 1
      player1_mark = select_mark("Choose your mark - x or o")
      @player1 = Player.new(player1_mark)
    elsif number_of_players == 2
      player1_mark = select_mark("Player 1, choose your mark - x or o")
      @player1 = Player.new(player1_mark)
      if player1_mark.downcase == "x"
        @player2 = Player.new("o")
        @ui.print_message("Player 2, you will be 'o'")
      else
        @player2 = Player.new("x")
        @ui.print_message("Player 2, you will be 'x'")
      end
    end
    run_game_sequence(@player1, @player2)
  end

  def select_mark(message)
    @mark = @ui.get_input(message)
    if not is_mark_valid?(mark)
      select_mark("Please enter 'x' or 'o'")
    end
    @mark
  end

  def is_mark_valid?(mark_to_validate)
    if mark_to_validate.downcase == "x" || mark_to_validate.downcase == "o"
        return true
    else
        return false
    end
  end

  def run_game_sequence(player1, player2)
    if @game_state.is_winner_declared?
      if @game_state.is_winner?(@player1)
        game_over(@player1.mark)
      elsif @game_state.is_winner?(@player2)
        game_over(@player2.mark)
      end
    elsif @game_state.is_board_full?
      if @game_state.is_a_tie?
        game_over("")
      end
    else
      p1_move = get_player_move(@player1)
      @board.spaces[p1_move] = @player1.mark
      @ui.print_board(@board.rows)

      if @game_state.is_winner_declared?
        if @game_state.is_winner?(@player1.mark)
          p "winner"
          game_over(@player1.mark)
        end
      end

      p2_move = get_player_move(@player2)
      @board.spaces[p2_move] = @player2.mark
      @ui.print_board(@board.rows)


      run_game_sequence(@player1, @player2)
    end
  end

  def get_player_move(player)
     move = player.move
     if is_move_valid?(move)
       return move
     else
       get_player_move(player)
     end
  end

  def is_move_valid?(move)
    @board.available_spaces.include?(move)
  end

  def game_over(mark)
    if mark == ""
      @ui.print_message("Tie game!")
    else
      @ui.print_message("#{mark} wins!")
    end
  end

end

if __FILE__ == $0
  game = Game.new(Board.new(9), UI.new)
  game.start_new_game("Welcome to Tic Tac Toe")
end
