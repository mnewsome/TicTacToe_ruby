require "rspec"
require "game_sequence"
require "human_player"
require "player_finder"
require "tic_tac_toe_board"
require "user_interface"

describe GameSequence do

  before(:each) do
    @gs = GameSequence.new(ttt_board=TicTacToeBoard.new(9), PlayerFinder, ui=UserInterface.new)
    @ttt_board = ttt_board
  end


  it "create 2 human players for the game" do
    player_array = []
    @human1 = HumanPlayer.new
    @human2 = HumanPlayer.new
    player_array << @human1
    player_array << @human2
    @gs.create_players(2)

    player_array[0].should be_instance_of HumanPlayer
    player_array[1].should be_instance_of HumanPlayer
  end

  it "create names for the players" do
    player_array = @gs.create_players(2)
    @gs.set_player_names(player_array, "Malcolm", "Newsome")
    @gs.player1.name.should == "Malcolm"
    @gs.player2.name.should == "Newsome"
  end

  it "set the player marks" do
    player_array = @gs.create_players(2)
    @ttt_board.stub(:is_mark_valid?).and_return(true)
    @gs.set_player_marks(player_array, "x")
    @gs.player1.mark.should == "x"
    @gs.player2.mark.should == "o"
  end

  it "set player marks" do
    player_array = @gs.create_players(2)
    @ttt_board.stub(:is_mark_valid?).and_return(true)
    @gs.set_player_marks(player_array, "o")
    @gs.player1.mark.should == "o"
    @gs.player2.mark.should == "x"
  end

  it "game is over due to tie" do
    @ttt_board.stub(:tie?).and_return(true)
    @ttt_board.stub(:winner).and_return(nil)
    @gs.game_over?.should == true
  end

  it "game is over due to winner" do
    @ttt_board.stub(:tie?).and_return(false)
    @ttt_board.stub(:winner).and_return("x")
    @gs.game_over?.should == true
  end

  it "game is not over" do
    @ttt_board.stub(:tie?).and_return(false)
    @ttt_board.stub(:winner).and_return(nil)
    @gs.game_over?.should == false
  end
end
