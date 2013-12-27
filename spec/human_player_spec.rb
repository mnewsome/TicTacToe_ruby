require "rspec"
require "human_player"
require "user_interface"

describe HumanPlayer do

  before(:each) do
    @human = HumanPlayer.new("Malcolm", "x", UserInterface.new )
  end

  it "get the player's name" do
    @human.name.should == "Malcolm"
  end

  it "get the player's mark" do
    @human.mark.should == "x"
  end

  it "get the player's move" do
    @human.ui.stub(:get_input).and_return(7)
    @human.move("enter move").should == 7
  end

end
