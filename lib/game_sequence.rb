class GameSequence

  attr_accessor :player1, :player2

  def initialize(ttt_board, player_finder, ui)
    @ttt_board = ttt_board
    @player_finder = player_finder
    @ui = ui
  end

  def start_new_game
    @ui.print_message("Welcome to Tic Tac Toe!")
    @ui.print_board(@ttt_board.rows)
    players = create_players(number_of_players)
    names = get_player_names
    set_player_names(players, names[0], names[1])
    player1_mark = get_player_mark
    set_player_marks(players, player1_mark)
    run_game_sequence
  end

  def create_players(player_count)
    @player_finder.find(player_count)
  end

  def set_player_names(players, name1, name2="Player 2")
    @player1 = players[0]
    @player1.set_name(name1)
    @player2 = players[1]
    @player2.set_name(name2)
  end

  def set_player_marks(players, player1_mark_choice)
    if @ttt_board.is_mark_valid?(player1_mark_choice)
      @player1 = players[0]
      @player2 = players[1]
      @player1.set_mark(player1_mark_choice)
      @player1.mark == "x" ? @player2.set_mark("o") : @player2.set_mark("x")
    else
      set_player_marks(players, player1_mark_choice)
    end
  end

  def run_game_sequence
    if game_over?
      print_winner_or_tie
    else
      if @player1.mark == "x"
        x_make_move(@player1)
        o_make_move(@player2)
        run_game_sequence
      else
        x_make_move(@player2)
        o_make_move(@player1)
        run_game_sequence
      end
    end
  end

  def game_over?
    !@ttt_board.game_in_progress?
  end

  private

  def number_of_players
    selected_number = @ui.get_input("How many players (1 or 2)?").to_i
    if selected_number == 1 || selected_number == 2
      return selected_number
    else
      number_of_players
    end
  end

  def get_player_names
    names_array = []
    first_player = @ui.get_input("Player 1, please enter your name: ")
    second_player = @ui.get_input("Player 2, please enter your name: ")
    names_array << first_player
    names_array << second_player
  end

  def get_player_mark
    selected_mark = @ui.get_input("Player 1, choose your mark (x or o)").to_s.downcase
    if @ttt_board.is_mark_valid?(selected_mark)
      return selected_mark
    else
      get_player_mark
    end
  end

  def get_valid_move(player)
    move = @ui.get_input("#{player.name}, pick your space")
    begin
      @ttt_board.fill_space_at(move, player.mark)
      @ui.print_board(@ttt_board.rows)
    rescue ArgumentError
      @ui.print_message("That space is not available")
      get_valid_move(player)
    end
  end

  def print_winner_or_tie
    if @ttt_board.tie?
      @ui.print_message("Tie Game! Thanks for playing!")
      exit
    else
      @ui.print_message("#{@ttt_board.winner} Wins! Thanks for playing!")
      exit
    end
  end

  def x_make_move(player)
    get_valid_move(player)
    if game_over?
      print_winner_or_tie
    end
  end

  def o_make_move(player)
    get_valid_move(player)
    if game_over?
      print_winner_or_tie
    end
  end

end
