require "rspec"
require "board"

describe Board do
  before(:each) do
    @board = Board.new(9)
  end

  it "creates spaces based on number inputted" do
    Board.new(9).size.should == 9
    Board.new(3).size.should == 3
  end

  it "every space is numbered by default" do
    @board.get_value_at(1).should == 1
  end

  it "values can be retrieved by space number" do
    @board.fill_space_at(2, "o")
    @board.get_value_at(2).should == "o"
  end

  it "every space can be filled" do
    @board.fill_space_at(1, "some arbitrary value")
    @board.get_value_at(1).should == "some arbitrary value"
  end

  it "return all spaces with their values" do
    @board.fill_space_at(1, "some value")
    @board.spaces.should == ["some value", 2, 3, 4, 5, 6, 7, 8, 9]
  end
end
