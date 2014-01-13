require "rspec"
require "computer_player"

describe ComputerPlayer do

  before(:each) do
    @computer = ComputerPlayer.new
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
end
