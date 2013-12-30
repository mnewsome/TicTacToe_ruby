$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

require "human_player"
require "player_finder"
require "tic_tac_toe_board"
require "user_interface"

class Run

  attr_accessor :player1, :player2

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
      players = PlayerFinder.find(2, "HumanPlayer")
      set_player_names(players)
    else
      create_players
    end
  end

  def set_player_names(players)
    @player1 = players[0]
    player1.set_name(@ui.get_input("Player 1, please enter your name: "))

    if players[1].instance_of? HumanPlayer
      @player2 = players[1]

      player2.set_name(@ui.get_input("Player 2, please enter your name: "))
    end
    set_player_marks(@player1)
  end

  def set_player_marks(player)
    player1_mark = @ui.get_input("#{player.name}, choose your mark (x or o): ").downcase
    if is_mark_valid?(player1_mark)
      player.set_mark(player1_mark)
      player1_mark == "x" ? @player2.set_mark("o") : @player2.set_mark("x")
      @ui.print_message("#{@player1.name}, you will be #{@player1.mark}")
      @ui.print_message("#{@player2.name}, you will be #{@player2.mark}")
    else
      set_player_marks(player)
    end
  end

  def is_mark_valid?(mark)
    mark.downcase == "x" || mark.downcase == "o"
  end

  def run_game_sequence
    check_for_winner_or_tie
    get_x_move
    get_o_move
    run_game_sequence
  end

  def check_for_winner_or_tie
    if @ttt_board.tie?
      game_over("tie")
    elsif !@ttt_board.winner.nil?
      game_over(@ttt_board.winner)
    else
      nil
    end
  end

  def get_x_move
    if @player1.mark == "x"
      get_valid_move(@player1)
    else
      get_valid_move(@player2)
    end
  end

  def get_o_move
    if @player1.mark == "o"
      get_valid_move(@player1)
    else
      get_valid_move(@player2)
    end
  end

  def get_valid_move(player)
    begin
      move = @ui.get_input("#{player.name}, make your move: ")
      @ttt_board.fill_space_at(move, player.mark)
      @ui.print_board(@ttt_board.rows)
    rescue ArgumentError
      get_valid_move(player)
    end
    check_for_winner_or_tie
  end

  def game_over(winner)
    if winner == "tie"
      @ui.print_message("Tie Game!  Thanks for playing!")
    else
      @ui.print_message("#{winner} Wins!!  Thanks for playing")
    end
    exit
  end

end

if __FILE__ == $0
  run = Run.new
  run.run_game_sequence
end
