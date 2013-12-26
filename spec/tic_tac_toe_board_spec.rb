require "rspec"
require "tic_tac_toe_board"

describe TicTacToeBoard do

  before(:each) do
    @ttt_board = TicTacToeBoard.new(9)
  end

  it "creates a new Tic Tac Toe board" do
    TicTacToeBoard.new(9).size.should == 9
  end

  it "spaces are numbered 1-9 by default" do
    @ttt_board.spaces.should == [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  it "split into 3 rows" do
    @ttt_board.rows.should == [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  it "split into 3 columns" do
    @ttt_board.columns.should == [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  end

  it "return the values of the left diagonal" do
    @ttt_board.fill_space_at(5, "some value")
    @ttt_board.left_diagonal.should == [1, "some value", 9]
  end

  it "return the valuue of the right diagonal" do
    @ttt_board.fill_space_at(3, "some value")
    @ttt_board.right_diagonal.should == ["some value", 5, 7]
  end

  it "don't allow a move if the space is filled" do
    @ttt_board.fill_space_at(1, "some value")
    expect { @ttt_board.fill_space_at(1, "different value") }.to raise_error(ArgumentError, "Space not available")
    expect { @ttt_board.fill_space_at(10, "different value") }.to raise_error(ArgumentError, "Space not available")
  end

  it "top row winner should be x" do
    @ttt_board.fill_space_at(1, "x")
    @ttt_board.fill_space_at(2, "x")
    @ttt_board.fill_space_at(3, "x")
    @ttt_board.winner.should == "x"
  end

  it "middle row winner should be x" do
    @ttt_board.fill_space_at(4, "x")
    @ttt_board.fill_space_at(5, "x")
    @ttt_board.fill_space_at(6, "x")
    @ttt_board.winner.should == "x"
  end

  it "bottom row winner should be x" do
    @ttt_board.fill_space_at(7, "x")
    @ttt_board.fill_space_at(8, "x")
    @ttt_board.fill_space_at(9, "x")
    @ttt_board.winner.should == "x"
  end

  it "left column winner should be x" do
    @ttt_board.fill_space_at(1, "x")
    @ttt_board.fill_space_at(4, "x")
    @ttt_board.fill_space_at(7, "x")
    @ttt_board.winner.should == "x"
  end

  it "middle column winner should be x" do
    @ttt_board.fill_space_at(2, "x")
    @ttt_board.fill_space_at(5, "x")
    @ttt_board.fill_space_at(8, "x")
    @ttt_board.winner.should == "x"
  end

  it "bottom column winner should be x" do
    @ttt_board.fill_space_at(3, "x")
    @ttt_board.fill_space_at(6, "x")
    @ttt_board.fill_space_at(9, "x")
    @ttt_board.winner.should == "x"
  end

  it "left diagonal winner should be x" do
    @ttt_board.fill_space_at(1, "x")
    @ttt_board.fill_space_at(5, "x")
    @ttt_board.fill_space_at(9, "x")
    @ttt_board.winner.should == "x"
  end

  it "right diagonal winner should be x" do
    @ttt_board.fill_space_at(3, "x")
    @ttt_board.fill_space_at(5, "x")
    @ttt_board.fill_space_at(7, "x")
    @ttt_board.winner.should == "x"
  end

  it "game is a tie if all spaces full and no winner" do
    @ttt_board.fill_space_at(1, "x")
    @ttt_board.fill_space_at(2, "o")
    @ttt_board.fill_space_at(3, "x")
    @ttt_board.fill_space_at(4, "o")
    @ttt_board.fill_space_at(5, "x")
    @ttt_board.fill_space_at(6, "o")
    @ttt_board.fill_space_at(7, "o")
    @ttt_board.fill_space_at(8, "x")
    @ttt_board.fill_space_at(9, "o")
    @ttt_board.tie?.should == true
  end

  it "game is not a tie if the spaces are full but there is a winner" do
    @ttt_board.fill_space_at(1, "x")
    @ttt_board.fill_space_at(2, "x")
    @ttt_board.fill_space_at(3, "x")
    @ttt_board.fill_space_at(4, "o")
    @ttt_board.fill_space_at(5, "o")
    @ttt_board.fill_space_at(6, "x")
    @ttt_board.fill_space_at(7, "x")
    @ttt_board.fill_space_at(8, "x")
    @ttt_board.fill_space_at(9, "o")
    @ttt_board.tie?.should == false
  end

  it "game is in progress if there is no winner and game is not tied" do
    @ttt_board.fill_space_at(1, "x")
    @ttt_board.game_in_progress?.should == true
  end

  it "game is not in progress if board is full and no winner" do
    @ttt_board.fill_space_at(1, "x")
    @ttt_board.fill_space_at(2, "o")
    @ttt_board.fill_space_at(3, "x")
    @ttt_board.fill_space_at(4, "o")
    @ttt_board.fill_space_at(5, "x")
    @ttt_board.fill_space_at(6, "o")
    @ttt_board.fill_space_at(7, "o")
    @ttt_board.fill_space_at(8, "x")
    @ttt_board.fill_space_at(9, "o")
    @ttt_board.game_in_progress?.should == false
  end

  it " game is not in progress if there is a winner" do
    @ttt_board.fill_space_at(1, "x")
    @ttt_board.fill_space_at(2, "x")
    @ttt_board.fill_space_at(3, "x")
    @ttt_board.game_in_progress?.should == false
  end

  it "game is not a tie if the spaces are not full" do
    @ttt_board.fill_space_at(1, "x")
    @ttt_board.fill_space_at(9, "o")
    @ttt_board.tie?.should == false
  end

end
