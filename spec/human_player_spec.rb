require "rspec"
require "human_player"
require "user_interface"

describe HumanPlayer do

  before(:each) do
    @human = HumanPlayer.new
  end

  it "get the player's name" do
    @human.set_name("Malcolm")
    @human.name.should == "Malcolm"
  end

  it "get the player's mark" do
    @human.set_mark("x")
    @human.mark.should == "x"
  end

  it "get the player's move" do
    @human.set_move(7)
    @human.move.should == 7
  end

end
