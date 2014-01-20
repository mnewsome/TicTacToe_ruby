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

  it "return the depth of the board" do
    Board.new(9).depth.should == 3
    Board.new(16).depth.should == 4
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

  it "don't allow a move if the space is filled" do
    @board.fill_space_at(1, "some value")
    expect { @board.fill_space_at(1, "different value") }.to raise_error(ArgumentError, "Space 1 not available")
    expect { @board.fill_space_at(10, "different value") }.to raise_error(ArgumentError, "Space 10 not available")
  end



  it "reset the space back to it't default value" do
    @board.fill_space_at(1, "x")
    @board.reset_space_at(1)
    @board.spaces.should == [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  it "space is available" do
    @board.is_space_available_at?(1).should == true
  end

  it "space is not available" do
    @board.fill_space_at(1, "x")
    @board.is_space_available_at?(1).should == false
  end

  it "list of available spaces" do
    @board.fill_space_at(1, "x")
    @board.fill_space_at(2, "o")
    @board.fill_space_at(3, "x")
    @board.available_spaces.should == [4,5,6,7,8,9]
  end
end
