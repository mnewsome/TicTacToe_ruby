require "rspec"
require "computer_player"
require "tic_tac_toe_board"

describe ComputerPlayer do

  before(:each) do
    @computer = ComputerPlayer.new
    @ttt_board = TicTacToeBoard.new(9)
  end

  it "return a name" do
    @computer.set_name("Computer Player")
    @computer.name.should == "Computer Player"
  end

  it "get player's mark" do
    @computer.set_mark("o")
    @computer.mark.should == "o"
  end

  it "get computer player's move" do
    @computer.set_move(6)
    @computer.move.should == 6
  end

  it "get best move" do
    @computer.set_mark("x")
    @ttt_board.fill_space_at(1, "x")
    @ttt_board.fill_space_at(2, "o")
    @ttt_board.fill_space_at(3, "x")
    @ttt_board.fill_space_at(4, "o")
    @ttt_board.fill_space_at(5, "x")
    @ttt_board.fill_space_at(6, "o")
    @computer.get_best_move(@ttt_board).should == 7
  end

  it "get best move" do
    @ttt_board.fill_space_at(1, "x")
    @ttt_board.fill_space_at(2, "o")
    @ttt_board.fill_space_at(3, "x")
    @ttt_board.fill_space_at(4, "o")
    @ttt_board.fill_space_at(5, "x")
    @ttt_board.fill_space_at(7, "o")
    @computer.get_best_move(@ttt_board).should == 9
  end

  it "get best move" do
    @ttt_board.fill_space_at(1, "x")
    @ttt_board.fill_space_at(5, "o")
    @ttt_board.fill_space_at(2, "x")
    @computer.get_best_move(@ttt_board).should == 3
  end

end
