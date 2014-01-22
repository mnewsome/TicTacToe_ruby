class GameSequence

  attr_accessor :player1, :player2, :selected_number_of_players

  def initialize(ttt_board, player_finder, ui)
    @ttt_board = ttt_board
    @player_finder = player_finder
    @ui = ui
  end

  def start_new_game
    @ui.print_message("Welcome to Tic Tac Toe!")
    players = create_players(number_of_players)
    names = get_player_names
    set_player_names(players, names[0], names[1])
    player1_mark = get_player_mark
    set_player_marks(players, player1_mark)
    @ui.print_board(@ttt_board.rows)
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
    if @ttt_board.game_over?
      print_winner_or_tie
    else
      make_move(first_player_to_make_move)
      make_move(second_player_to_make_move)
      run_game_sequence
    end
  end

  private

  def number_of_players
    @selected_number_of_players = @ui.get_input("How many players (1 or 2)?").to_i
    if @selected_number_of_players == 1 || @selected_number_of_players == 2
      return @selected_number_of_players
    else
      number_of_players
    end
  end

  def get_player_names
    names_array = []
    first_player_name = @ui.get_input("Player 1, please enter your name: ")
    if @selected_number_of_players == 2
      second_player_name = @ui.get_input("Player 2, please enter your name: ")
    else
      second_player_name  = "Computer Player"
    end
    names_array << first_player_name
    names_array << second_player_name
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
    if player.name == "Computer Player"
      @ui.print_message( "I'm thinking of a move. One moment please...")
      move = player.get_best_move(@ttt_board)
    else
      move = @ui.get_input("#{player.name}, pick your space")
    end
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

  def make_move(player)
    get_valid_move(player)
    if @ttt_board.game_over?
      print_winner_or_tie
    end
  end

  def first_player_to_make_move
    if @player1.mark == "x"
      return @player1
    else
      return @player2
    end
  end

  def second_player_to_make_move
    if @player1.mark == "o"
      return @player1
    else
      return @player2
    end
  end

end
