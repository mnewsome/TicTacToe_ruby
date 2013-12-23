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

end

